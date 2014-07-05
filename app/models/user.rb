class User < ActiveRecord::Base


  attr_accessible :age, :email, :gender, :password, :password_confirmation, :zip
  has_secure_password 
  has_many :votes
  validates_presence_of :password, on: :create

end

