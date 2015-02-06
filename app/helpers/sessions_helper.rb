module SessionsHelper
	def log_in(admin)
		session[:admin_id] = admin.id 
		self.current_admin=(admin)
	end

	def current_admin=(admin)
	 	@current_admin = admin
	end

	def current_admin
		@current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
	end

	def logged_in?
		!current_admin.nil?
	end

	def log_out
		session[:admin_id] = nil
		self.current_admin = nil
	end

	def current_admin?(admin)
		admin == self.current_admin
	end

	def require_logged_in
		if !logged_in?
			deny_access
		end
	end

	def deny_access
		flash[:notice] = "Please sign in to access this page"
		redirect_to '/'
	end
end
