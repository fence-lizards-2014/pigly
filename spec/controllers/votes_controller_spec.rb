require 'spec_helper'

describe VotesController do
 let(:vote) { FactoryGirl.create :vote }
 let(:user) { User.find(vote.user_id) } # user and his votes
 let(:item) { Item.find(vote.item_id) } # item and its votes

  context "create" do

    it "sets the user_id field " do
      expect(vote.user_id).to eq(user.id)
    end

    it "set the item_id field" do
      expect(vote.item_id).to eq(item.id)
    end
  end
end