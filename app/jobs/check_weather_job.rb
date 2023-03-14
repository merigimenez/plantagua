class CheckWeatherJob < ApplicationJob
  queue_as :default

  def perform(garden)
    rain = WeatherService.new(garden).call
    garden_plants = garden.garden_plants
    garden_plants.each do |garden_plant|
      garden_plant.update(last_day: Date.today) if garden_plant.outdoor && rain
    end
  end
end
