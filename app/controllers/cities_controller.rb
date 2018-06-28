require Rails.root.join('app', 'services', 'get_weather')

class CitiesController < ApplicationController
  before_action :find_city, only: :show

  def index
    # добавить пагинацию страниц
    @cities = City.all
  end

  def show
    @response = GetWeather.new(@city).call
  rescue Net::OpenTimeout
    @response = nil 
  end

  private

  def find_city
    @city = City.find_by(id: params[:id])
    redirect_to city_url if @city.nil?
  end
end
