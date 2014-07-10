class Facebook
  include HTTParty
  base_uri 'https://graph.facebook.com'

  FACEBOOK_REDIRECT_URI = "http://dbc-pigly.herokuapp.com/facebook"

  def self.get_token(code)
    returned_key = self.get("/oauth/access_token?client_id=#{ENV['FACEBOOK_CLIENT']}&redirect_uri=#{FACEBOOK_REDIRECT_URI}&client_secret=#{ENV['FACEBOOK_SECRET']}&code=#{code}")
    /=(.+)&/.match(returned_key)[1]
  end

  def self.get_user_info(auth_token)
    user_info = self.get("/me?access_token=#{auth_token}")
    JSON.parse(user_info)
  end

  def self.get_user_photo_url(auth_token)
    photo_json_data = self.get("/me/picture?redirect=0&fields=url&access_token=#{auth_token}")
    JSON.parse(photo_json_data)["data"]["url"]
  end

  def self.get_user_friends(auth_token)
    friends_json = self.get("/me/friends?access_token=#{auth_token}")
    JSON.parse(friends_json)["data"]
  end
end