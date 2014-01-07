class NotificationsMailer < ActionMailer::Base

  default from: 'noreply@mythrowback.com'
  default to: 'ryanscottbuchholtz@gmail.com'

  def new_message(message)
    @message = message
  end
  
end