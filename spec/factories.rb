FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    age { rand(18..90) }
    gender { ["male", "female"].sample }
    zip { Faker::Address.zip }
    password { Faker::Internet.password(8) }
  end

  factory :restaurant do
    name { Faker::Company.name }
    location { "San Francisco" }
    latitude { 37.749917 }
    longitude { -122.417908 }
  end

  factory :item do
    name { Faker::Lorem.word }
    restaurant_id { rand(1..25) }
  end

  factory :vote do
    association :item
    association :user
    direction { ["up", "down"].sample }
  end
end