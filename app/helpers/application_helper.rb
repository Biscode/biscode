module ApplicationHelper

	def authorize_user_text(user)
		if user.is_authorized
			'UnAuthorize'
		else
			'Authorize'
		end
	end

	def join_team_text(user)
		if user.from_team
			'Fire'
		else
			'Join Team'
		end
	end

end
