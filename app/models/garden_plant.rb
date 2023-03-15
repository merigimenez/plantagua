class GardenPlant < ApplicationRecord
  has_one_attached :photo
  belongs_to :garden
  belongs_to :plant
  validates :last_day, presence: true
  validate :date_not_in_future

  # validates :plant_id, uniqueness: { scope: :garden_id }

  HUMANIZED_ATTRIBUTES = {
    :last_day => "Last watering day",
  }

  def self.human_attribute_name(attr, options={})
    HUMANIZED_ATTRIBUTES[attr.to_sym] || super
  end

  def date_not_in_future
    if self.last_day > Date.today
      errors.add(:last_day, "can't be in the future")
    end
  end

end
