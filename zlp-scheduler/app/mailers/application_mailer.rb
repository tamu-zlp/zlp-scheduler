class ApplicationMailer < ActionMailer::Base
  # ToDo: setup the sender email and send verification email on send grid
  default from: "FakeSender" # ENV['SENDGRID_SENDER']
  layout 'mailer'
end
