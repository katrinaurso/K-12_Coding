class DashboardsController < ApplicationController
  before_action :require_logged_in

  def index
    @admin = Admin.find(current_admin)

    @newsfeed = Newsfeed.new
  end

  def new
  end

  def create
    @newsfeed = Newsfeed.create(content:params[:newsfeed][:content], admin:current_admin, school:current_school)
    if @newsfeed.save
      flash[:notice] = 'Newsfeed added!'
    else
      flash[:errors] = @newsfeed.errors.full_messages
    end
    redirect_to dashboard_path @newsfeed
  end

  def show
    @newsfeed = Newsfeed.find(params[:id])
  end

  def edit
    @newsfeed = Newsfeed.find(params[:id])
  end

  def update
     @newsfeed = Newsfeed.find(params[:id])
    if @newsfeed.update(content:params[:newsfeed][:content], admin:current_admin, school:current_school)
      redirect_to dashboard_path @newsfeed
    else
      flash[:errors] = @newsfeed.errors.full_messages
      puts @newsfeed.errors.full_messages
      redirect_to edit_dashboard_path @newsfeed
    end
  end

  def destroy
  end
end
