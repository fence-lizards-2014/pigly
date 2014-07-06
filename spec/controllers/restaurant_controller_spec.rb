require 'spec_helper'

describe RestaurantsController do
 let(:item) { FactoryGirl.create :item }
 let(:restaurant) { Restaurant.find(item.restaurant_id) } # restaurant and its items

  context 'show' do

    it 'lists the associated items' do
      expect(item.restaurant_id).to eq(restaurant.id)
    end
  end
end