class User < ActiveRecord::Base
  attr_accessible :age, :email, :gender, :password, :zip
end
