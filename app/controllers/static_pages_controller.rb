class StaticPagesController < ApplicationController
	def about
		@team_members = User.all.where(from_team: true)
	end
end
