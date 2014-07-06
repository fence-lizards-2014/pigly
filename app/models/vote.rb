class Vote < ActiveRecord::Base
	attr_accessible :direction, :user_id, :item_id
	belongs_to :item
	belongs_to :user
end