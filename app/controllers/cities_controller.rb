class CityController < ApplicationController
  before_action :find_city, only: :show

  def index
    @cities = City.all
  end

  def show; end

  private

  def find_city
    @city = City.find_by(id: params[:id])
    redirect_to city_url if @city.nil?
  end
end
