class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :user_gardens
  has_many :notifications, dependent: :destroy
  has_many :gardens, through: :user_gardens
  has_many :garden_plants, through: :gardens

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :gardens, dependent: :destroy
  # has_many :messages
  has_one_attached :photo

  validates_uniqueness_of :email
  validates_presence_of :email, :full_name, :notification_time

  # refactor to select (filter array)
  def plants_to_water
    plants_due = []

    self.gardens.each do |garden|
      garden.garden_plants.each do |element|
        month = Date.today.strftime("%B")
        water_date = (element.last_day + element.plant.frequency[month.downcase])
        plants_due << element if water_date == Date.today
      end
    end

    plants_due
  end

end
