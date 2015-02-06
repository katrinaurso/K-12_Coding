class DashboardsController < ApplicationController
  before_action :require_logged_in

  def index
    @admin = Admin.find(current_admin)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
