class CheckWeatherJob < ApplicationJob
  queue_as :default

  def perform(garden)
    outdoor_plants = garden.garden_plants.where(outdoor: true)
    return unless outdoor_plants.nil?

    rain = WeatherService.new(garden).call
    return unless rain

    outdoor_plants.each { |plant| plant.update(last_day: Date.today) }
  end
end
