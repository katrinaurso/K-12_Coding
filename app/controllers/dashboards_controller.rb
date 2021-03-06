class DashboardsController < ApplicationController
  before_action :require_logged_in, :current_school
  layout "backend"

  def index
    @admin = Admin.find(current_admin)
    @style = Style.where(school:current_school)
    @newsfeed = Newsfeed.new
    @newsfeeds = Newsfeed.where(school:current_school).reverse
  end

  def new
  end

  def create
    @newsfeed = Newsfeed.create(title:params[:newsfeed][:title], content:params[:newsfeed][:content], admin:current_admin, updated_by:current_admin, school:current_school)
    if @newsfeed.save
      flash[:notice] = 'Newsfeed added!'
      redirect_to dashboard_path @newsfeed
    else
      flash[:errors] = @newsfeed.errors.full_messages
      redirect_to dashboards_path
    end
  end

  def show 
    # Queries need to be merged into one if there is time
    @newsfeed_check = Newsfeed.joins(:admin).select("newsfeeds.*, admins.first_name, admins.last_name").find(params[:id])
    if current_school.id == @newsfeed_check.school_id
      @newsfeed = @newsfeed_check
      @updated_by = Newsfeed.joins(:updated_by).select('admins.*').find(params[:id])
      @admin = Admin.find(current_admin)
    else
      redirect_to dashboards_path
    end
  end

  def edit
    @newsfeed = Newsfeed.find(params[:id])
    @admin = Admin.find(current_admin)
    if current_school.id != @newsfeed.school_id
      redirect_to dashboards_path
    end
  end

  def update
     @newsfeed = Newsfeed.find(params[:id])
    if @newsfeed.update(newsfeed_params)
      redirect_to dashboard_path @newsfeed
    else
      flash[:errors] = @newsfeed.errors.full_messages
      puts @newsfeed.errors.full_messages
      redirect_to edit_dashboard_path @newsfeed
    end
  end

  def destroy
    @newsfeed = Newsfeed.find(params[:id]).destroy
    redirect_to dashboards_path
  end

  private
  def newsfeed_params
    params.require(:newsfeed).permit(:title, :content, :updated_by, :image)
  end
end
