require 'spec_helper'

describe UsersController do
  before :each do
    @user = create(:user)
  end

  context 'create user' do

     it 'redirects to the root path upon save' do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to root_url
    end
  end

    context 'with valid attributes' do

     it 'saves a new user in the database' do
      expect{
        post :create, user: attributes_for(:user)
      }.to change(User, :count).by(1)
    end
  end
end

