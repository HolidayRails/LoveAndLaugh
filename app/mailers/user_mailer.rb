class UserMailer < ActionMailer::Base
  default from: "info@loveandlaughterplayschool.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_confirmation.subject
  #
  def account_confirmation user
    @user = user
    mail to: user.email, subject: "Welcome to Love And Laughter Playschool."
  end
end
