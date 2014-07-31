class Vote < ActiveRecord::Base
  attr_accessible :direction, :user_id, :item_id
  belongs_to :item
  belongs_to :user

  validates :user_id, :uniqueness => { :scope => :item_id }

  def liked?
    if self.direction == "up"
      "liked"
    elsif self.direction == "down"
      "disliked"
    end
  end

  private

  def self.determine_vote(current_user, given_item_id, direction)
    if Vote.user_has_voted_on_item?(current_user, given_item_id) && Vote.directions_match?(current_user, given_item_id, direction)
      current_user.votes.find_by_item_id(given_item_id).destroy
      class_adjust = 'destroy'
    elsif Vote.user_has_voted_on_item?(current_user, given_item_id) && !Vote.directions_match?(current_user, given_item_id, direction)
      current_user.votes.find_by_item_id(given_item_id).destroy
      vote = Vote.new(item_id: given_item_id, user_id: current_user.id, direction: direction)
      vote.save
      class_adjust = 'switch'
    elsif !Vote.user_has_voted_on_item?(current_user, given_item_id)
      vote = Vote.new(item_id: given_item_id, user_id: current_user.id, direction: direction)
      vote.save
      class_adjust = 'new'
    end
  end

  def self.user_has_voted_on_item?(current_user, given_item_id)
    !current_user.votes.find_by_item_id(given_item_id).nil?
  end

  def self.directions_match?(current_user, given_item_id, direction)
    current_user.votes.find_by_item_id(given_item_id).direction == direction
  end
end