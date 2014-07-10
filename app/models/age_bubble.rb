class AgeBubble
  attr_accessor :restaurant_id
  def initialize(restaurant_id)
    @restaurant_votes = Item.where(restaurant_id: restaurant_id).map(&:votes).flatten
  end

  def get_nodes
    add_group_totals_to_nodes
  end

  private
  def user(user_id)
    return User.find(user_id)
  end

  def positive_votes_per_user_by_age
    positive_votes_count = 0
    positive_votes_hash = {}
    @restaurant_votes.each do |vote|
      age = user(vote.user_id).age
      if vote.direction == 'up'
        positive_votes_count += 1
        positive_votes_hash[age] = {total_positive_votes: positive_votes_count}
      end
    end
    return positive_votes_hash
  end

  def create_nodes
    group_hash = positive_votes_per_user_by_age
    group_hash.each_key do |age|
      case age
      when 18..30
        group_num = 0
        group = "18 - 30"
      when 31..40
        group_num = 1
        group = "31 - 40"
      when 41..50
        group_num = 2
        group = "41 - 50"
      when 51..60
        group_num = 3
        group = "51 - 60"
      else
       group_num = 4
       group = "61 - :)"
      end

      total_positive_votes = positive_votes_per_user_by_age[age][:total_positive_votes]
      group_hash[age] = {group_num: group_num, group: group, total_positive_votes: total_positive_votes, age: age}
    end

    group_hash
  end

  def add_group_totals_to_nodes
    totals = Hash.new(0)
    create_nodes.each do |age, node|
      totals[node[:group_num]] += node[:total_positive_votes]
    end

    get_group_hash = create_nodes
    get_group_hash.each do |age, node|
      i = 0
      while i <= 4
        node[:total_group_votes] = totals[i] if node[:group_num] == i
        i += 1
      end
   end
   return get_group_hash.values
  end
end