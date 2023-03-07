class Plant < ApplicationRecord
  belongs_to :garden

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :frequency, presence: true
  validates :last_day, presence: true
end
