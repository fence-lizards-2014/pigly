class Restaurant < ActiveRecord::Base
	attr_accessible :name, :location, :latitude, :longitude
	has_many :menu_items
end