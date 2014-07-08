class Item < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :restaurant_id
	attr_accessible :name, :restaurant_id
	belongs_to :restaurant
	has_many :votes

	def calculate_percentage
		if self.votes.count == 0
			0
		else
			((self.votes.where(direction: 'up').count / self.votes.count.to_f)*100).round
		end
	end
end