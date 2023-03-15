class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications
    @plants = current_user.garden_plants
  end
end
