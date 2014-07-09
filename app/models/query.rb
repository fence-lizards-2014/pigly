class DataPresenter
  attr_accessor :raw_data
  def initialize(raw_data)
    @raw_data = raw_data
  end

  def edges_to_json(opts={})
    @raw_data.map{|d| {source: d.values[0], target: d.values[1]}}.to_json
  end

  def nodes_to_json(opts={})
    @raw_data.map{|d| {item: d.values[0], val: d.values[1], pos: d.values[2]}}.to_json
  end
end

class Query
  attr_accessor :connection
  def self.edges_sql(restaurant)
    ActiveRecord::Base.connection.execute <<-EOSQL
    SELECT (y.row - 1) AS source, (z.row - 1) AS target
    FROM items i
    JOIN votes v
      ON v.item_id = i.id
    JOIN users u
      ON u.id = v.user_id
    JOIN restaurants r
      ON r.id = i.restaurant_id
    JOIN
    (
    SELECT u.id AS u_id, i.id AS item
    FROM items i
    JOIN votes v
      ON v.item_id = i.id
    JOIN users u
      ON u.id = v.user_id
    JOIN restaurants r
      ON r.id = i.restaurant_id
    WHERE r.id = #{restaurant.id}
    ) x
    ON x.u_id = u.id AND x.item > i.id
    JOIN
    (
    SELECT ROW_NUMBER()
        OVER (ORDER BY(COUNT(v.direction)) DESC) AS Row, i.id AS id
      FROM items i
      JOIN restaurants r
        ON r.id = i.restaurant_id
      JOIN votes v
        ON v.item_id = i.id
      WHERE r.id = #{restaurant.id}
      GROUP BY i.id
      ORDER BY COUNT(v.direction)
      ) y
      ON y.id = x.item
      JOIN
    (
    SELECT ROW_NUMBER()
        OVER (ORDER BY(COUNT(v.direction)) DESC) AS Row, i.id AS id
      FROM items i
      JOIN restaurants r
        ON r.id = i.restaurant_id
      JOIN votes v
        ON v.item_id = i.id
      WHERE r.id = #{restaurant.id}
      GROUP BY i.id
      ORDER BY COUNT(v.direction)
      ) z
      ON z.id = i.id
    WHERE r.id = #{restaurant.id}
    ORDER BY 1
    ;
    EOSQL
  end

  def self.nodes_sql(restaurant)
    ActiveRecord::Base.connection.execute <<-EOSQL
      SELECT i.name, COUNT(v.direction) AS votes, COUNT(CASE WHEN v.direction = 'up' THEN 'up' END) AS positive
      FROM items i
      JOIN restaurants r
        ON r.id = i.restaurant_id
      JOIN votes v
        ON v.item_id = i.id
      WHERE r.id = #{restaurant.id}
      GROUP BY 1
      ORDER BY 2 DESC
      ;
    EOSQL
  end
end
