# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def populate_menu(locu_id)
	menu = Locu.new.menu(locu_id)
	menu["objects"].first["menus"].first["sections"].each { |section| section["subsections"].each { |subsection| subsection["contents"].each { |type| Restaurant.find_by_locu_id(locu_id).menu_items << MenuItem.create(name: type["name"]) } } }
end

Locu.new.restaurants["objects"].each { |restaurant| Restaurant.create(name: restaurant["name"], location: restaurant["locality"], address: restaurant["street_address"], longitude: restaurant["long"], latitude: restaurant["lat"], phone: restaurant["phone"], postal_code: restaurant["postal_code"], locu_id: restaurant["id"], website: restaurant["website_url"])}

Restaurant.all.each { |restaurant| populate_menu(restaurant.locu_id) }
MenuItem.where(name: nil).destroy_all