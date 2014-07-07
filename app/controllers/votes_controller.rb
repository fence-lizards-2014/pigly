class VotesController < ApplicationController

	def create
    redirect_to :back if !logged_in?

    if user_has_voted_on_item? && directions_match?
      current_user.votes.find_by_item_id(params[:item_id]).destroy
    elsif user_has_voted_on_item? && !directions_match?
      current_user.votes.find_by_item_id(params[:item_id]).destroy
      vote = Vote.new(item_id: params[:item_id], user_id: current_user.id, direction: params[:direction])
      vote.save
    elsif !user_has_voted_on_item?
      vote = Vote.new(item_id: params[:item_id], user_id: current_user.id, direction: params[:direction])
      vote.save
    end

    current_item = Item.find(params[:item_id])
    percentage = ((current_item.votes.where(direction: 'up').count / current_item.votes.count.to_f)*100).round

    respond_to do |format|
      msg = { percentage: percentage }
      format.json { render :json => msg }
    end
  end

  private

  def user_has_voted_on_item?
    !current_user.votes.find_by_item_id(params[:item_id]).nil?
  end

  def directions_match?
    current_user.votes.find_by_item_id(params[:item_id]).direction == params[:direction]
  end

end