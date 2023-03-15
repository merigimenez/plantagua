class NotificationsController < ApplicationController
  def index
    @plants = current_user.garden_plants
  end
end
