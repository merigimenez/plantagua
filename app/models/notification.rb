class Notification < ApplicationRecord
  belongs_to :user
  after_create :send_water_email

  # when notification is created, email is sent
  def send_water_email
    UserMailer.with(user: self.user).water.deliver_now
    # UserMailer.with(user: @garden.user).water.deliver_later(wait_until: 10.hours.from_now)
  end
end
