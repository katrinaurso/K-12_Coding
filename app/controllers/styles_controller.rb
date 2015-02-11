class StylesController < ApplicationController
  before_action :require_logged_in, :current_school

  def edit
  	@admin = Admin.find(current_admin)
  	@style = Style.find(params[:id])
  	render layout: "backend"
  end

  def update
  	@style = Style.find(params[:id])
  	@previous = @style.current
  	if @style.update(current:params[:style][:current], previous:@previous)
      redirect_to dashboards_path
    else
      flash[:errors] = ["You have removed all styling.  Is that what you wanted?"] 
  	  redirect_to edit_style_path @style
    end
  end
end
