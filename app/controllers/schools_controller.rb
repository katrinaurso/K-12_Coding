class SchoolsController < ApplicationController
  def index
  end

  def show
  	@newsfeed = Newsfeed.where(school:params[:id])
  end
end
