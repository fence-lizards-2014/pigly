class VoteController < ApplicationController

	def create
    @vote = Vote.new(vote_params) #type up or down
    @vote.save!
  end


	private

	def vote_params
		params.require(:vote).permit(:direction)
	end

end



