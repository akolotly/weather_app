class City < ActiveRecord::Base
  TIME_ZONES = ActiveSupport::TimeZone.all.map(&:name).freeze

  validates :name, :latitude, :longitude, :time_zone, presence: true
  validates :time_zone, inclusion: { in: TIME_ZONES,
    message: "%{value} не существует. Выберите из списка" }
end
