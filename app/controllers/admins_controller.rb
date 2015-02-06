class AdminsController < ApplicationController
  def index
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      log_in @admin
      redirect_to @admin
    else
      flash[:errors] = @admin.errors.full_messages
      redirect_to dashboards_path
    end
  end

  def show
    if logged_in?
      @admin = Admin.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/'
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :pass, :pass_confirmation, :school_id)
  end
end
