class AdminsController < ApplicationController
  before_action :current_school
  
  def index
  end

  def new
    @admin = Admin.new
    render layout: "login_registration"
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.save
      log_in @admin
      redirect_to dashboards_path
    else
      flash[:errors] = @admin.errors.full_messages
      redirect_to '/'
    end
  end

  def show
    if logged_in?
      @admin = Admin.find(params[:id])
      render layout: "backend"
    else
      redirect_to '/'
    end
  end

  def edit
    if logged_in?
      @admin = Admin.find(params[:id])
      render layout: "backend"
    else
      redirect_to '/'
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to dashboards_path
    else
      flash[:errors] = @admin.errors.full_messages
      redirect_to edit_admin_path @admin
    end
  end

  def destroy
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :pass, :pass_confirmation, :school_id)
  end
end
