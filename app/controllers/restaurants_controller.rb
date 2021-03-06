class RestaurantsController < ApplicationController

  def search #Post route to find restaurant
    @restaurant = Restaurant.find_by_name(params[:restaurant][:name])
    redirect_to restaurant_path(@restaurant)
  rescue ActionController::RoutingError => e
    redirect_to root_path, notice: "Restaurant Not Found."
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @items = @restaurant.sort_by_percent
    @top_five_items = @items.shift(5) # lists top 5 menu items with content
    @remaining_items = @items
    @nodes_for_bubbles = AgeBubbleController.get_nodes_for_restaurant_id((params[:id])).to_json
    @visnodes = QueryController.item_nodes(@restaurant).nodes_to_json
    @visedges = QueryController.item_edges(@restaurant).edges_to_json
  rescue ActiveRecord::RecordNotFound => e
    redirect_to root_path, notice: "Restaurant Not Found."
  end

end