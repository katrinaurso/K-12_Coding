require 'json'
require 'net/http'
require 'open-uri'

class SchoolsController < ApplicationController   
  def show
    @style = Style.select(:current).find(params[:id])
    puts @style
  	@school = School.find(params[:id])
  	@id = params[:id].to_i
  	@newsfeed = Newsfeed.where(school:params[:id]).reverse

	  $weather_uri = "https://api.worldweatheronline.com/free/v1/weather.ashx?key=jtpc4myth9fwxjgwz9fh5fw5&q=#{@school.zipcode}&fx=no&format=json"

  	uri = URI.parse($weather_uri)
  	http = Net::HTTP.new(uri.host, uri.port)

  	http.use_ssl = true
  	http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  	request = Net::HTTP::Get.new(uri.request_uri)
  	response = http.request(request)

  	data = response.body

  	@weather = JSON.load(data)
  	# render :text => data
  end
end
