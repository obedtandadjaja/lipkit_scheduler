class MailgunMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailgun_mailer.lipkit_notification.subject
  
  default from: 'obed.tandadjaja@covenant.edu'

  def lipkit_notification(lipkit)
  	@record = lipkit
    mail to: "5594737555@tmomail.net", subject: "#{lipkit}"
  end
end
