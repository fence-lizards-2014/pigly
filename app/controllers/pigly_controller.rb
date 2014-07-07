class PiglyController < ApplicationController

	def index
		# homepage
		@restaurant = Restaurant.new
		@names = []
    #
    # Or, @restaurant = Restaurant.pluck(:name)
    # or, @restaurant = Restaurant.all.each_with_object([]){ |e, m| m << e.name }
    #
    # This is a misuse of Enumerable.
		Restaurant.all.each { |restaurant| @names << restaurant.name}
    #
    # session check in erb # Oh God no, no no no no.  Please don't tell me you
    # did that.  A before_action would be preferable.  Why would a *view* have
    # the responsiblity of CONTORLLING the display / redirect flow?  Nein.
    #
    # ::moments later::
    #
    # You did.  Don't.
	end

	def search
    # Huh, dafuq.  Why would a PiglyController control something that manages
    # Restaurant class instances?  Just because you load from Pigly#index
    # doesn't mean submit to Pigly#search
    #
    #
		# render restaurants.html.erb
		# search for restaurant name (name can be entered in search bar)
		# if name found, redirect to restaurant/#show
		# else prompt "restaurant not found"
	end

end

