class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :gardens, dependent: :destroy
  # has_many :messages
  has_one_attached :photo

  validates_uniqueness_of :email
  validates_presence_of :email, :full_name, :notification_time
end
