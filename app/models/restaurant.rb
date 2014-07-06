class Restaurant < ActiveRecord::Base
	attr_accessible :name, :location, :latitude, :longitude, :address, :phone, :postal_code, :locu_id, :website
	has_many :items
  accepts_nested_attributes_for :items
end