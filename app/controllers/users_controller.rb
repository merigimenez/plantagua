class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show; end

  # Edit a profile
  def edit; end

  # Save a profile update
  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render "users/edit", status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :notification_time, :photo)
  end
end
