class User < ActiveRecord::Base
  attr_accessible :age, :email, :gender, :password, :zip
  has_many :votes
end
