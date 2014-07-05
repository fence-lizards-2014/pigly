class PiglyController < ApplicationController
	
	def index
		# homepage
		@restaurant = Restaurant.new
		# session check in erb
	end

	def search
		# render restaurants.html.erb
		# search for restaurant name (name can be entered in search bar)
		# if name found, redirect to restaurant/#show
		# else prompt "restaurant not found"
	end

end
  
