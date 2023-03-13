class GardenPlant < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_one_attached :photo
  belongs_to :garden
  belongs_to :plant

  # validates :plant_id, uniqueness: { scope: :garden_id }
end
