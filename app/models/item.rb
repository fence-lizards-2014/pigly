class Item < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :restaurant_id
	attr_accessible :name, :restaurant_id
	belongs_to :restaurant
	has_many :votes
end