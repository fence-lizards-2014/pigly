class VotesController < ApplicationController

	def create
    user_id = current_user.id

    vote = Vote.new(menu_item_id: params[:menu_item], user_id: user_id, direction: params[:direction])
    vote.save

    redirect_to :back
  end

end
