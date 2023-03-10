class Plant < ApplicationRecord
  has_many :garden_plants, dependent: :destroy
  has_many :gardens, through: :garden_plant

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :frequency, presence: true
end
