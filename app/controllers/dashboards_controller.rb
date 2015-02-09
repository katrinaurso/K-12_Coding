class DashboardsController < ApplicationController
  before_action :require_logged_in
  layout "backend"

  def index
    @admin = Admin.find(current_admin)
    @newsfeed = Newsfeed.new
    @newsfeeds = Newsfeed.where(school:current_school).reverse
    @school = current_school
  end

  def new
  end

  def create
    @newsfeed = Newsfeed.create(title:params[:newsfeed][:title], content:params[:newsfeed][:content], admin:current_admin, updated_by:current_admin, school:current_school)
    if @newsfeed.save
      flash[:notice] = 'Newsfeed added!'
    else
      flash[:errors] = @newsfeed.errors.full_messages
    end
    redirect_to dashboard_path @newsfeed
  end

  def show 
    # Queries need to be merged into one if there is time
    @newsfeed_check = Newsfeed.joins(:admin).select("newsfeeds.*, admins.first_name, admins.last_name").find(params[:id])
    if current_school.id == @newsfeed_check.school_id
      @newsfeed = @newsfeed_check
      @updated_by = Newsfeed.joins(:updated_by).select('admins.*').find(params[:id])
      @school = current_school
      @admin = Admin.find(current_admin)
    else
      redirect_to dashboards_path
    end
  end

  def edit
    @newsfeed = Newsfeed.find(params[:id])
    @school = current_school
    @admin = Admin.find(current_admin)
    if current_school.id != @newsfeed.school_id
      redirect_to dashboards_path
    end
  end

  def update
     @newsfeed = Newsfeed.find(params[:id])
    if @newsfeed.update(title:params[:newsfeed][:title], content:params[:newsfeed][:content], updated_by:current_admin)
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
end
