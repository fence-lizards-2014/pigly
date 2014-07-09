class RestaurantsController < ApplicationController

	def index
		# render view restaurants/index.html.erb (rest by name)
		# upon click, redirect to restaurants/show.html.erb
	end

	def search #post
		@restaurant = Restaurant.find_by_name(params[:restaurant][:name])
		redirect_to restaurant_path(@restaurant)
	end

	def show
		@restaurant = Restaurant.find(params[:id])
		@items = sort_by_percent(@restaurant)
		@top_five_items = @items.shift(5)
		@remaining_items = @items
		@nodes_for_bubbles = AgeBubbleController.get_group_totals(params[:id]).to_json
		# render view restaurants/.id.html.erb
		# lists top 5 menu items with content
				#add logic to list top 5 based on highest votes
				# upon 'dropdown click', show all menu items orderd by votes


		# upon 'vote click', session check in view restaurants/.id.html.erb
				# if session, vote/#create
				# else prompt: sign in/up to vote


		# upon 'profile click', render new view: profile.html.erb
	end

	def show_profile
		@restaurant = Restaurant.find(params[:id])
		#render new view: profile.html.erb
					#show dashboard of restaurant and patrons (=users)
					#min 3 dashboards
	end

	private

	def sort_by_percent(restaurant)
		@voted_items = restaurant.items.select {|item| item.votes.count > 0}
		@unvoted_items = restaurant.items.select {|item| item.votes.count == 0}
		@voted_items.sort_by! { |item| item.calculate_percentage }.reverse + @unvoted_items
	end

	def restaurant_params
		params.require(:restaurant).permit(:name, :location, :latitude, :longitude, :address, :phone, :postal_code, :website, :locu_id, items: [ :name ])
	end

end

