class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.water.subject
  #
  def water
    @user = params[:user]
    @plants = @user.garden_plants
    # @plants = @user.plants_to_water

    # This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: 'Time to water your plant')
  end
end

# UserMailer.with(user: User.first, discount: true)
# # You can access these values inside user_mailer.rb
# # with params[:user] and params[:discount]

# UserMailer.with(user: User.first).water
