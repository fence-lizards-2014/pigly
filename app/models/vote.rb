class Vote < ActiveRecord::Base
	attr_accessible :direction, :user_id
	belongs_to :menu_item
	belongs_to :user
end