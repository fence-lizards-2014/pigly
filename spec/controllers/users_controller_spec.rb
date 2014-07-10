require 'spec_helper'

describe UsersController do
  before :each do
    @user = create(:user)
  end

  context '#new' do
    it 'should assign @user as new user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
      expect(response).to render_template("new")
    end
  end

  context 'create user' do
    it 'redirects to the root path upon save' do
      post :create, user: attributes_for(:user)
      expect(response).to redirect_to root_url
    end

    context 'with valid attributes' do
      it 'saves a new user in the database' do
        expect{
          post :create, user: attributes_for(:user)
        }.to change(User, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 're-renders the new page' do
        post :create, user: attributes_for(:user, password: nil)
        expect(response).to render_template :new
      end
    end
  end
end