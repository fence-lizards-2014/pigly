class VotesController < ApplicationController

	def create
    # First, check if user is signed in. If user is a guest, the client 
    # will alert them to log in before attempting to vote.
    if !logged_in?
      respond_to do |format|
        msg = { guest: "guest" }
        format.json { render :json => msg }
      end
    else
      class_adjust = Vote.determine_vote(current_user, params[:item_id], params[:direction])
      percentage = Item.find(params[:item_id]).calculate_percentage

      respond_to do |format|
        format.json { render :json => { percentage: percentage, class_adjust: class_adjust } }
      end
    end
  end
  
end