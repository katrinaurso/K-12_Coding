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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
