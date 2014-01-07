# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Throwback::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.sendgrid.net',
  :port           => '587',
  :authentication => :plain,
  :user_name      => ENV['app20936676@heroku.com'],
  :password       => ENV['thkrctfr'],
  :domain         => 'heroku.com',
  :enable_starttls_auto => true
}
