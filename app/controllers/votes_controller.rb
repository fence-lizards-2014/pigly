class VotesController < ApplicationController

	def create
    user_id = current_user.id

    if user_id
      vote = Vote.new(menu_item_id: params[:menu_item_id], user_id: user_id, direction: params[:direction])
      vote.save
    end

    # Put this on a get route and available con the show
    # current_item = MenuItem.find(params[:menu_item_id])
    # upvote_count = current_item.votes.where(direction: 'up').count
    # @downvote_count = current_item.votes.where(direction: 'down').count

    # respond_to do |format|
    #   msg = { total: upvote_count }
    #   format.json { render :json => msg }
    # end
  end

end
