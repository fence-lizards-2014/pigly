require 'spec_helper'

describe VotesController do

  context "create attempt via user" do
    let(:vote) { FactoryGirl.create :vote, direction: 'up' }
    let(:user) { User.find(vote.user_id) } # user and his votes
    let(:item) { Item.find(vote.item_id) } # item and its votes

    it "sets the user_id field of the vote" do
      expect(vote.user_id).to eq(user.id)
    end

    it "set the item_id field of the vote" do
      expect(vote.item_id).to eq(item.id)
    end

    it "has a current user" do
      expect(vote.user_id).to_not be_nil
    end

    it "returns class_adjust of 'new' if voting on an item for the first time" do
      item
      item2 = FactoryGirl.create :item
      stub_current_user(user)
      json = { :format => 'json', direction: "up", item_id: 2 }
      post :create, json
      expect(response.content_type).to include("json")
      expect(JSON.parse(response.body)).to have_key("class_adjust")
    end
  end

  context "create attempt via guest" do
    it "does not create a vote" do
      expect{
        json = { :format => "json", :item_id => 2, :direction => "up" }
        post :create, json
      }.to change(Vote, :count).by(0)
    end

    it "responds with json with key guest" do
      json = { :format => "json", :vote => { :id => 1, :direction => "up" } }
      post :create, json
      expect(response.content_type).to include("json")
      expect(JSON.parse(response.body)).to have_key("guest")
    end
  end
end

