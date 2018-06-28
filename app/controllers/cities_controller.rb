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
    @forecast = converting_utc_time_into_local_city_time(@response)
  rescue Net::OpenTimeout
    @response = nil 
  end

  private

  def find_city
    @city = City.find_by(id: params[:id])
    redirect_to cities_path if @city.nil?
  end

  def converting_utc_time_into_local_city_time(response)
    response.dig('list').map do |weather_for_3_hours|
      next weather_for_3_hours if weather_for_3_hours['dt_txt'].nil?
      utc_time = DateTime.parse(weather_for_3_hours['dt_txt'])
      local_time = utc_time.in_time_zone(@city.time_zone)
      weather_for_3_hours['dt_txt'] = local_time.strftime("%Y:%m:%d %H:%M")
      weather_for_3_hours
    end
  end
end
