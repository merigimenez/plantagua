class CreateNotificationJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "Checking plants to be watered today for #{user.full_name}..."
    plants = user.plants_to_water
    Notification.create(user: user) unless plants.empty?
    puts "Done!"
  end
end
