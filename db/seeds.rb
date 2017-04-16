# This will produce real data, commented out so we don't waste API calls:
# def populate_menu(locu_id)
# 	menu = Locu.new.menu(locu_id)
# 	menu["objects"].first["menus"].first["sections"].each { |section| section["subsections"].each { |subsection| subsection["contents"].each { |type| Restaurant.find_by_locu_id(locu_id).items << Item.create(name: type["name"]) } } }
# end


# Restaurant.all.each { |restaurant| populate_menu(restaurant.locu_id) }

# Item.where(name: nil).destroy_all

# The following is fake data to try out:
# Restaurant.create(name: "Range", location: "San Francisco", latitude: "37.759464", longitude: "-122.421550", address: "842 valencia street", phone: "15.282.8283", postal_code: "94110", website: "www.rangesf.com")

# ["local king salmon with cilantro rice noodles, squid, pickled vegetables, aioli and chili lime vinaigrette",
#   "olive oil poached california white sea bass with english peas, spring onions, mint and kumquat relish",
#   "braised duck leg with fava beans, dried cherry compote, savory granola and hazelnut milk",
#   "roasted chicken with with caramelized squash, toasted farro, almonds and basil gremolata",
#   "pan seared blade steak with crispy brown rice, blue lake beans, charred scallions and black bean sauce",
#   "fava bean falafel with nardello peppers, smoky eggplant, cucumber yogurt and spiced flatbread",
#   "purée of squash soup with black olive tapenade and chives",
#   "young vegetable salad with red leaf lettuces, fresh goat cheese and champagne vinaigrette",
#   "cucumber and nectarine slaw with basil, poppy seed dressing and toasted pumpkin seeds",
#   "smoked trout rillette with pickled red beets, horseradish cream and rye toast",
#   "chicken liver mousse with a frisee salad",
#   "glazed duck wings with marinated mushrooms, sea beans and spicy mustard",
#   "egg noodle pasta with fava bean pesto and herbed ricotta"
#  ].each { |item| Restaurant.first.items.create(name: item)}

200.times do
  user = User.create(email: Faker::Internet.email,
    age: rand(18..70),
    gender: ["male", "female"].sample,
    zip: Faker::Address.zip ,
    password: Faker::Internet.password(8))
end

# 25.times do
#   restaurant = Restaurant.create!(name: Faker::Company.name,
#     location: "San Francisco",
#     latitude: 7.749917,
#     longitude: -122.417908)
# end


# 300.times do
#   item = Item.create!(name: Faker::Lorem.sentence,
#      restaurant_id: rand(2..25))
# end

4000.times do
  vote = Vote.create(direction: ["up", "down"].sample,
       item_id: rand(1..1238),
       user_id: rand(11..200))
end