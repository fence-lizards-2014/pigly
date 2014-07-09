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
		auth_token = Facebook.get_token(params[:code])
		user_info = Facebook.get_user_info(auth_token)
		photo = Facebook.get_user_photo_url(auth_token)
		if User.find_by_facebook_id(user_info["id"])
			User.find_by_facebook_id(user_info["id"]).update_attributes(facebook_token: auth_token)
			session[:user_id] = User.find_by_facebook_id(user_info["id"]).id
		else
			@user = User.create(email: user_info["email"], facebook_name: user_info["name"], facebook_token: auth_token, password: SecureRandom.hex, zip: "94114", gender: "male", age: 20, facebook_photo_url: photo, facebook_id: user_info["id"])
			session[:user_id] = @user.id
		end
		redirect_to root_path, notice: "Successfully signed in with Facebook."
	end

	def friends
		friends = Facebook.get_user_friends(current_user.facebook_token)
		id_list = friends.map{ |friend| friend["id"] }
		votes = id_list.map!{ |id| User.find_by_facebook_id(id).votes if !User.find_by_facebook_id(id).nil? }
		@sorted_votes = votes.delete_if{ |vote| vote == nil }.flatten!.sort_by{ |vote| vote.updated_at }.reverse!
	end

end