class AgeBubbleController < ApplicationController

  def self.get_nodes_for_restaurant_id(restaurant_id)
    AgeBubble.new(restaurant_id).get_nodes
  end
end