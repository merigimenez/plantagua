class Garden < ApplicationRecord
  has_many :user_gardens, dependent: :destroy
  has_many :users, through: :user_gardens
  has_many :garden_plants, dependent: :destroy
  has_many :plants, through: :garden_plants
  geocoded_by :location

  validates :name, presence: true
  validates :location, presence: true
  validates :name, length: { maximum: 14 }
  after_validation :geocode, if: :will_save_change_to_location?
end
