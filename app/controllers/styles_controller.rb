class StylesController < ApplicationController
	  before_action :require_logged_in, :current_school

  def create
  	@style = Style.new
  end

  def edit
  	@style = Style.find(1)
  end

  def update
  	@style = Style.find(1)
  end
end
