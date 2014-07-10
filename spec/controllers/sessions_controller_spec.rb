require 'spec_helper'

describe SessionsController do

  context "#new" do
    it "is successful if signed out" do
      get :new
      expect(response).to be_success
    end

    let(:user) { FactoryGirl.create :user }
    it "redirects to root if signed in" do
      stub_current_user(user)
      get :new
      expect(response).to redirect_to(root_path)
    end
  end

  context "#facebook" do
    it "finds a user by facebook id if one already exists" do
      user = FactoryGirl.create(:user, facebook_id:"user_id")
      Facebook.should_receive(:get_token).with("user_code") { "user_token" }
      Facebook.should_receive(:get_user_info).with("user_token") { { "id"=> "user_id", "name"=> "user_name", "email"=> "user_email" } }
      Facebook.should_receive(:get_user_photo_url).with("user_token") { "photo_path" }
      get "facebook", code: "user_code"
      expect(session[:user_id]).to eq(user.id)
    end

    it "creates a new user by facebook id if one does not already exist" do
      Facebook.should_receive(:get_token).with("user_code") { "user_token" }
      Facebook.should_receive(:get_user_info).with("user_token") { { "id"=> "user_id", "name"=> "user_name", "email"=> "user_email" } }
      Facebook.should_receive(:get_user_photo_url).with("user_token") { "photo_path" }
      expect{
        get "facebook", code: "user_code"
      }.to change(User, :count).by(1)
      user = User.last
      expect(user.id).to eq(1)
      expect(user.email).to eq("user_email")
      expect(user.zip).to eq("94114")
      expect(user.age).to eq(20)
      expect(user.facebook_photo_url).to eq("photo_path")
      expect(user.facebook_token).to eq("user_token")
      expect(user.facebook_name).to eq("user_name")
    end

    it "redirects to the home page" do
      Facebook.should_receive(:get_token).with("user_code") { "user_token" }
      Facebook.should_receive(:get_user_info).with("user_token") { { "id"=> "user_id", "name"=> "user_name", "email"=> "user_email" } }
      Facebook.should_receive(:get_user_photo_url).with("user_token") { "photo_path" }
      get "facebook", code: "user_code"
      expect(response).to redirect_to(root_path)
    end
  end

  context "#friends" do
    it "goes to friends page if signed in through facebook and has no fb friends" do
      user = FactoryGirl.create(:user, facebook_id:"user_id")
      Facebook.stub(:get_user_friends) { [] }
      stub_current_user(user)
      get "friends"
      expect(response.status).to eq(200)
    end

    it "goes to friends page if signed in through facebook and has friends with no votes" do
      user = FactoryGirl.create(:user, facebook_id:"user_id", facebook_token:"token")
      Facebook.should_receive(:get_user_friends).with(user.facebook_token) { ["1234"] }
      friend = FactoryGirl.create(:user, facebook_id:"1234")
      stub_current_user(user)
      get "friends"
      expect(response.status).to eq(200)
    end

    it "goes to friends page if signed in through facebook and has friends with votes" do
      user = FactoryGirl.create(:user, facebook_id:"user_id", facebook_token:"token")
      Facebook.should_receive(:get_user_friends).with(user.facebook_token) { [{ "id" => "1234" }] }
      friend = FactoryGirl.create(:user, facebook_id:"1234")
      restaurant = FactoryGirl.create(:restaurant)
      restaurant.items.create(name: "Test_Item")
      Vote.create(item_id: 1, user_id: 2, direction: "up")
      stub_current_user(user)
      get "friends"
      expect(response.status).to eq(200)
      expect(response).to have_content friend.facebook_name
    end

    it "redirects to root path if signed in through email" do
      user = FactoryGirl.create :user
      stub_current_user(user)
      get "friends"
      expect(response).to redirect_to(root_path)
    end

    it "redirects to root path if not signed in" do
      get "friends"
      expect(response).to redirect_to(root_path)
    end
  end

end