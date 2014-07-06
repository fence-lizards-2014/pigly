class VotesController < ApplicationController

	def create
    user_id = current_user.id

    if user_id
      vote = Vote.new(item_id: params[:item_id], user_id: user_id, direction: params[:direction])
      vote.save
    end

    # Put this on a get route and available con the show
    # @downvote_count = current_item.votes.where(direction: 'down').count

    current_item = Item.find(params[:item_id])
    percentage = ((current_item.votes.where(direction: 'up').count / current_item.votes.count.to_f)*100).round

    respond_to do |format|
      msg = { percentage: percentage }
      format.json { render :json => msg }
    end
  end

end