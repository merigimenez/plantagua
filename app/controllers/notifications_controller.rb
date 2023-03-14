class NotificationsController < ApplicationController
  # after_create :send_water_email


  def index
    @notifications = current_user.notifications
  end

  # def notify
  #     notification = true
  #     send_water_email if notification?
  # end

  # private

  # iterate over gardens and get user from garden
  # def send_water_email
  #   UserMailer.with(user: @garden.user).water.deliver_later(wait_until: 10.hours.from_now)
  # end

end
