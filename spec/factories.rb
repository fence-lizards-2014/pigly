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
  end

  factory :menu_item do
    name { Faker::Lorem.word }
    restaurant_id { rand(1..25) }
  end

  factory :vote do
    direction { ["up", "down"].sample }
    menu_item_id { rand(1..100) }
    user_id { rand(1..25) }
  end
end