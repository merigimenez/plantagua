class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.water.subject
  #
  def water
    # This came by default
    @message = "Don't forget to water your plant today!"
    # @plant = user.garden_plant

     # Instance variable => available in view

    # @user = params[:user]
    @user = User.last

    # This will render a view in `app/views/user_mailer`!
    mail(to: @user.email, subject: 'Time to water your plant')
  end

end
