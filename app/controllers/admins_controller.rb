class AdminsController < ApplicationController
  before_action :current_school
  
  def index
  end

  def new
    @admin = Admin.new
    render layout: "login_registration"
  end

  def create
    @admin = Admin.new(admin_params)
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
      redirect_to admin_path @admin
    else
      flash[:errors] = @admin.errors.full_messages
      redirect_to edit_admin_path @admin
    end
  end

  def add
    @image = Admin.find(params[:id])
    if @image.update(admin_params)
      redirect_to admin_path @image
    else
      flash[:errors] = @image.errors.full_messages
      redirect_to edit_admin_path @image
    end
  end

  def destroy
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation, :school_id, :image)
  end
end
