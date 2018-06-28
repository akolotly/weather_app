require Rails.root.join('app', 'services', 'get_weather')

class CitiesController < ApplicationController
  before_action :find_city, only: :show

  def index
    # добавить пагинацию страниц
    @cities = City.all
  end

  def show
    @response = Rails.cache.fetch("#{@city.id}/#{@city.updated_at}/current_weather", expires_in: 1.hours) do
      GetWeather.new(@city).call
    end
  rescue Net::OpenTimeout
    @response = nil 
  end

  private

  def find_city
    @city = City.find_by(id: params[:id])
    redirect_to cities_path if @city.nil?
  end
end
