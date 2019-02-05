# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address: 'mail.privateemail.com',
  port: '587',
  authentication: :plain,
  user_name: ENV['email_username'],
  password: ENV['email_password'],
  enable_starttls_auto: true
}
