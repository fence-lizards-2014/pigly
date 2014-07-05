class MenuItem < ActiveRecord::Base
	attr_accessible :name
	belongs_to :restaurant
	has_many :votes
end