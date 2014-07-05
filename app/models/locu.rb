class Locu
  include HTTParty
  base_uri 'http://api.locu.com/v1_0'

  def initialize
    @app_key = LOCU_API_KEY
  end

  def restaurants
    self.class.get("/venue/search/?has_menu=true&category=restaurant&locality=san+francisco&api_key=#{@app_key}")
  end

  def menu venue_id
    self.class.get("/venue/#{venue_id}/?api_key=#{@app_key}")
    # results["objects"].first["menus"].each { |menu| menu["sections"].first["subsections"].first["contents"].each { |item| Restaurant.find_by_locu_id(venue_id).menu_items << MenuItem.create(name: item["name"])}}
  end

  def populate_menu
    
  end
end