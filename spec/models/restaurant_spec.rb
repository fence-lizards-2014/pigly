require 'spec_helper'

describe Restaurant do

  context 'validations' do

    it 'should have valid name, location, latitude and longitude attributes' do
      restaurant = create(:restaurant)
      expect(restaurant).to be_valid
    end

    it 'should invalidate if name is missing' do
      expect(build(:restaurant, name: nil)).to have(1).errors_on(:name)
    end
  end
end