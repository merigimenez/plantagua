class GardenPlant < ApplicationRecord
  has_one_attached :photo
  belongs_to :garden
  belongs_to :plant
  validates :last_day, presence: true

  # validates :plant_id, uniqueness: { scope: :garden_id }
end
