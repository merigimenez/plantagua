namespace :garden_plant do
  desc "Update the last day the plant of the user was watered if it rains"
  task update_all: :environment do
    # gardens = Garden.all
    Garden.all.each do |garden|
      CheckWeatherJob.perform_later(garden)
    end
  end
end
