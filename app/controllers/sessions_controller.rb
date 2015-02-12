class SessionsController < ApplicationController
  def new
    render layout: "login_registration"
  end

  def create
  	admin = Admin.authenticate(params[:session][:email], params[:session][:password])
  	if admin.nil?
  		flash[:notice] = 'Admin not found!'
  		redirect_to root_path
  	else 
  		log_in admin
  		redirect_to dashboards_path
  	end
  end

  def destroy
  	log_out
  	redirect_to '/'
  end
end
