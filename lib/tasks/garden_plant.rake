namespace :garden_plant do
  desc "Update the last day the plant of the user was watered if it rains"
  task update_all: :environment do
    gardens = Garden.all
    gardens.each do |garden|
      CheckWeatherJob.perform_now(garden)
    end
  end
end
