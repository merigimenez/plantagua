class Garden < ApplicationRecord
  has_many :user_gardens
  has_many :users, through: :user_gardens
  has_many :garden_plants, dependent: :destroy
  has_many :plants, through: :garden_plants


  validates :name, presence: true
  validates :location, presence: true
end
