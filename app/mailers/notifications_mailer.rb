class NotificationsMailer < ActionMailer::Base

  def new_message(message)
    @message = message
    email_from = @message.email
    email_to = 'ryanscottbuchholtz@gmail.com'
    mail to: email_to, subject: @message.subject
    mail from: email_from

  end
  
end