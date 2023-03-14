class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :garden_plant
end
