class QueryController < ApplicationController

  def self.item_edges(restaurant)
    DataPresenter.new(Query.edges_sql(restaurant))
  end

  def self.item_nodes(restaurant)
    DataPresenter.new(Query.nodes_sql(restaurant))
  end

end