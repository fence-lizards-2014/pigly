class Item < ActiveRecord::Base
	attr_accessible :name, :restaurant_id
	belongs_to :restaurant
	has_many :votes
end