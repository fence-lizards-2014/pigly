class User < ActiveRecord::Base

  attr_accessible :age, :email, :gender, :password, :password_confirmation, :zip, :facebook_photo_url, :facebook_id, :facebook_token, :facebook_name

  has_many :votes
  accepts_nested_attributes_for :votes

  has_secure_password
  validates_presence_of :password
  validates_presence_of :email
  validates_uniqueness_of :email, on: :create
  validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"  
  validates_inclusion_of :gender, :in => %w( male female )
  validates_inclusion_of :age, :in => 0..120, message: "should be valid numeric age"
end