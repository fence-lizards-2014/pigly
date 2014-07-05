class Locu
  include HTTParty
  base_uri 'http://api.locu.com/v1_0'

  def initialize
    @app_key = ENV[:locu_key]
  end

  def restaurants
    self.class.get("/venue/search/?has_menu=true&category=restaurant&locality=san+francisco&api_key=#{ENV[:locu_key]}")
  end

  def menu venue_id
    self.class.get("/venue/#{venue_id}/?api_key=#{ENV[:locu_key]}")
  end
end