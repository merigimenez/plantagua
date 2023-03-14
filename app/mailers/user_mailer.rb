class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.water.subject
  #
  def water
    # This came by default
    @plant_name = "plant_name"
    # @plant = user.garden_plant.plant.name

     # Instance variable => available in view

    @user = params[:user]
    # @user = User.last
    # array of plant to be watered

    # This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: 'Time to water your plant')
  end
end

# UserMailer.with(user: User.first, discount: true)
# # You can access these values inside user_mailer.rb
# # with params[:user] and params[:discount]

# UserMailer.with(user: User.first).water
