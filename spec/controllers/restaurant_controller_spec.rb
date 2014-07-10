require "spec_helper"

describe RestaurantsController do
  render_views
  let!(:user) { FactoryGirl.create :user }
  let!(:user2) { FactoryGirl.create :user }
  let!(:item) { FactoryGirl.create :item }
  let(:restaurant) { Restaurant.find(item.restaurant_id) } # restaurant and its items

  context "search" do
    it "routes to the page of the restaurant name found" do
      json = { :format => "json", restaurant: { name: restaurant.name } }
      post :search, json
      expect(response).to redirect_to restaurant_path(restaurant)
    end
  end

  context "show" do
    it "assigns restaurant id" do
      get :show, id: restaurant.id
      expect(assigns(:restaurant)).to eq(restaurant)
    end
    it "will show an unvoted item as 0%" do
      item = restaurant.items.create name: "No Votes"
      get :show, id: restaurant.id
      expect(response.body).to have_content "0%"
    end
  end
end