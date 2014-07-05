class Votes < ActiveRecord::Base
	belongs_to :menu_item
	belongs_to :user
end