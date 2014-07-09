class Locu
  include HTTParty
  base_uri 'http://api.locu.com/v1_0'

  LOCU_API_QUERY_ENDPOINT = "/venue/search/?has_menu=true&category=restaurant&locality=san+francisco&api_key="

  def initialize
    @app_key = ENV['LOCU_API_KEY']
  end

  def restaurants
    self.class.get("%s%s" % [LOCU_API_QUERY_ENDPOINT, @app_key])
  end

  def menu venue_id
    self.class.get("/venue/#{venue_id}/?api_key=#{@app_key}")
  end
end