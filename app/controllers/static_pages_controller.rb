class StaticPagesController < ApplicationController
	skip_before_filter :authenticate_user!
	
	def about
		@team_members = User.all.where(from_team: true)
	end
end
