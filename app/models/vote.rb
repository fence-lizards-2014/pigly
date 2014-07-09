class Vote < ActiveRecord::Base
	attr_accessible :direction, :user_id, :item_id
	belongs_to :item
	belongs_to :user

	validates :user_id, :uniqueness => { :scope => :item_id }

	def liked?
		if self.direction == "up"
			"liked"
		elsif self.direction == "down"
			"disliked"
		end
	end
end