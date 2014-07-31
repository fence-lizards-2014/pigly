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
      @user = User.create!({
        email: user_info["email"], 
        facebook_name: user_info["name"], 
        facebook_token: auth_token, 
        password: SecureRandom.hex, 
        zip: "94114", 
        gender: "male", 
        age: 20, 
        facebook_photo_url: photo, 
        facebook_id: user_info["id"]
      })
      session[:user_id] = @user.id
    end

    redirect_to root_path, notice: "Successfully signed in with Facebook."
  end

  def friends
    if logged_in? && current_user.facebook_id
      friends = Facebook.get_user_friends(current_user.facebook_token)

      @sorted_votes = if friends.any?
        ids   = friends.map { |friend| friend["id"] }
        users = User.where(facebook_id: ids).includes(:votes)
        votes = users.flat_map(&:votes).compact

        votes.sort_by(&:updated_at).reverse if votes.count >= 1
      end

      @sorted_votes ||= []
    else
      redirect_to root_path, notice: "Please sign in with Facebook to see friends."
    end
  end

end