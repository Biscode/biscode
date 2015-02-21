module ApplicationHelper

	def authorize_user_text_helper(user)
		if user.is_authorized
			'UnAuthorize'
		else
			'Authorize'
		end
	end

end
