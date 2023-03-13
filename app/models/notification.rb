class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :garden_plant
  enum notification_type: %i[raininig watering]

  def content
    if notification_type == 'raining'
      "bla #{garden_plant.name}"
    else
      "bla #{garden_plant.name}"
    end
  end
end
