class SessionsController < ApplicationController
  def new
  end

  def create
  	admin = Admin.authenticate(params[:session][:email], params[:session][:pass])
  	if admin.nil?
  		flash[:error] = 'Admin not found!'
  		redirect_to new_session_path
  	else 
  		log_in admin
  		redirect_to admin
  	end
  end

  def destroy
  	log_out
  end
end
