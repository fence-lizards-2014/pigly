class SessionsController < ApplicationController
	
	def new
		redirect_to root_path if logged_in?
		@user = User.new
	end

	def create
		@user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully signed in."
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_path, notice: "Have a Pigly day."
	end

	def facebook
		returned_key = HTTParty.get("https://graph.facebook.com/oauth/access_token?client_id=#{FACEBOOK_CLIENT}&redirect_uri=http://local.foo.com:3000/facebook&client_secret=#{FACEBOOK_SECRET}&code=#{params[:code]}")
		auth_token = /=(.+)&/.match(returned_key)[1]
		info = JSON.parse(HTTParty.get("https://graph.facebook.com/me?access_token=#{auth_token}"))
		name = info["name"]
		email = info["email"]
		facebook_id = info["id"]
		photo = JSON.parse(HTTParty.get("https://graph.facebook.com/me/picture?redirect=0&fields=url&access_token=#{auth_token}"))["data"]["url"]
		if User.find_by_facebook_id(facebook_id)
			session[:user_id] = User.find_by_facebook_id(facebook_id).id
		else
			@user = User.create(email: email, facebook_name: name, facebook_token: auth_token, password: SecureRandom.hex, zip: "94114", gender: "male", age: 20, facebook_photo_url: photo, facebook_id: facebook_id)
			session[:user_id] = @user.id
		end
		redirect_to root_path, notice: "Successfully signed in with Facebook."
	end

	def friends
		votes = []
		friends = JSON.parse(HTTParty.get("https://graph.facebook.com/me/friends?access_token=#{current_user.facebook_token}"))["data"]
		id_list = friends.map{ |friend| friend["id"] }
		id_list.each{ |id| votes << User.find_by_facebook_id(id).votes if !User.find_by_facebook_id(id).nil? }
		@sorted_votes = votes.flatten!.sort_by{ |vote| vote.updated_at }.reverse!
	end

end