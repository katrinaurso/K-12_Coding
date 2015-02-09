class SchoolsController < ApplicationController
  def index
  end

  def show
  	@school = School.find(params[:id])
  	@newsfeed = Newsfeed.where(school:params[:id]).reverse
  end
end
