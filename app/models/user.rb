class User < ActiveRecord::Base

  attr_accessible :age, :email, :gender, :password, :password_confirmation, :zip

  validates_presence_of :age, :gender, :zip, on: :create
  has_many :votes
  accepts_nested_attributes_for :votes

  has_secure_password
  validates_presence_of :password, on: :create

end

