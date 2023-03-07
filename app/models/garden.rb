class Garden < ApplicationRecord
  has_many :user_gardens
  has_many :users, through: :user_gardens
  # has_many :plants, dependent: :destroy

  validates :name, presence: true
  validates :location, presence: true
end
