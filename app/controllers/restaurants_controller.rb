class RestaurantsController < ApplicationController

	def search #Post route to find restaurant
		@restaurant = Restaurant.find_by_name(params[:restaurant][:name])
		redirect_to restaurant_path(@restaurant)
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@items = sort_by_percent(@restaurant)
		@top_five_items = @items.shift(5) # lists top 5 menu items with content
		@remaining_items = @items
		@nodes_for_bubbles = AgeBubbleController.get_group_totals(params[:id]).to_json
		@visnodes = QueryController.item_nodes(@restaurant).nodes_to_json
		@visedges = QueryController.item_edges(@restaurant).edges_to_json
	end

	private

	def sort_by_percent(restaurant)
		@voted_items = restaurant.items.select {|item| item.votes.count > 0}
		@unvoted_items = restaurant.items.select {|item| item.votes.count == 0}
		@voted_items.sort_by! { |item| item.calculate_percentage }.reverse + @unvoted_items
	end

end

