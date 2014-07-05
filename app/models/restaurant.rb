class Restaurant < ActiveRecord::Base
	attr_accessible :name, :location, :latitude, :longitude, :address, :phone, :postal_code, :locu_id, :website
	has_many :menu_items
end