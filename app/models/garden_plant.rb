class GardenPlant < ApplicationRecord
  belongs_to :garden
  belongs_to :plant

  # validates :plant_id, uniqueness: { scope: :garden_id }
end
