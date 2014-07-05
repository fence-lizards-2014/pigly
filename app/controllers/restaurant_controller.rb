class RestaurantController < ApplicationController
	
	def index
		# render view restaurants/index.html.erb (rest by name)
		# upon click, redirect to restaurants/show.html.erb
	end

	def search #post
		@restaurants = Restaurant.find_by_name(params[:name])
	end 


	def show
		@restaurant = Restaurant.find_by(params[:id])
		@menu_items = @restaurant.menu_items
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
		@restaurant = Restaurant.find_by(params[:id])
		#render new view: profile.html.erb
					#show dashboard of restaurant and patrons (=users)
					#min 3 dashboards 
	end 

end

