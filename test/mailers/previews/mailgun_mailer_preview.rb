# Preview all emails at http://localhost:3000/rails/mailers/mailgun_mailer
class MailgunMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mailgun_mailer/lipkit_notification
  def lipkit_notification
    MailgunMailer.lipkit_notification
  end

end
