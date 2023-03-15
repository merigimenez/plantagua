class CheckWeatherJob < ApplicationJob
  queue_as :default

  def perform(garden)
    outdoor_plants = garden.garden_plants.where(outdoor: true)
    return if outdoor_plants.empty?

    rain = WeatherService.new(garden).call
    return unless rain

    outdoor_plants.update_all(last_day: Date.today)
  end
end
