class UserGarden < ApplicationRecord
  belongs_to :garden
  belongs_to :user

  validates :user_id, uniqueness: { scope: :garden_id }
end
