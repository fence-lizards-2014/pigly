class PiglyController < ApplicationController

	def index # homepage
		@restaurant = Restaurant.new
		@names = Restaurant.all.map(&:name)
	end

end