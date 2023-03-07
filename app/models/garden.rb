class Garden < ApplicationRecord
  # has_many :users, through: :users_gardens, source: :xx
  # has_many :plants, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
end
