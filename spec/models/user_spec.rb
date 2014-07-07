require 'spec_helper'

describe User do

  context 'validations' do

    it 'has valid age, gender and zip attributes' do
      user = create(:user)
      expect(user).to be_valid
    end

    it 'should invalidate if password is missing' do
    	user = build(:user, password: nil)
    	p user.errors
      expect(build(:user, password: nil)).to have(1).errors_on(:password)
    end
  end
end