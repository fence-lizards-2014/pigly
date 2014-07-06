# This will produce real data, commented out so we don't waste API calls:
# def populate_menu(locu_id)
# 	menu = Locu.new.menu(locu_id)
# 	menu["objects"].first["menus"].first["sections"].each { |section| section["subsections"].each { |subsection| subsection["contents"].each { |type| Restaurant.find_by_locu_id(locu_id).items << Item.create(name: type["name"]) } } }
# end

# Locu.new.restaurants["objects"].each { |restaurant| Restaurant.create(name: restaurant["name"], location: restaurant["locality"], address: restaurant["street_address"], longitude: restaurant["long"], latitude: restaurant["lat"], phone: restaurant["phone"], postal_code: restaurant["postal_code"], locu_id: restaurant["id"], website: restaurant["website_url"])}

# Restaurant.all.each { |restaurant| populate_menu(restaurant.locu_id) }
# Item.where(name: nil).destroy_all

# The following is fake data to try out:
25.times { FactoryGirl.create :user }
25.times { FactoryGirl.create :restaurant }
100.times { FactoryGirl.create :item }
2000.times { FactoryGirl.create :vote }