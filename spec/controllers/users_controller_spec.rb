require 'spec_helper'

describe UsersController do
  context 'create user' do
   it "redirects to the root path upon save" do
    post :create, user: FactoryGirl.attributes_for(:user)
    expect(response).to redirect_to root_url
    end
  end

  it "assigns the requested user to @user" do
    user = create(:user)
    get :show, id: user
    expect(assigns(:user)).to eq user
  end

end

