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

  # This is kind of unhelpful.  Lorem is great for text, but it's hard to
  # troubleshoot the app without a real food.  Why not harvest something from
  # http://eatingatoz.com/food-list/.  Make a class "FoodSample.get_food" that
  # picks a random entry?  Greeked-out text for food is confusing.
  factory :item do
    association :restaurant
    name { Faker::Lorem.word }
  end

  factory :vote do
    association :item
    association :user
    direction { ["up", "down"].sample }
  end
end
