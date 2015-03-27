class UserMailer < ActionMailer::Base
  default from: "Love and Laughter Playschool" "info@loveandlaughterplayschool.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_confirmation.subject
  #
  def account_confirmation user
    @user = user
    mail to: user.email, subject: "Welcome to Love And Laughter Playschool."
  end

  def send_digest user, message
    @user = user
    @content = message.content
    mail(to: user.email, subject: message.title)
  end

  def remind_holiday user
    mail(to: user.email, subject: "Tomorrow is holiday")
  end
end
