class MenuItem < ActiveRecord::Base
	attr_accessible :content
	belongs_to :restaurant
	has_many :votes
end