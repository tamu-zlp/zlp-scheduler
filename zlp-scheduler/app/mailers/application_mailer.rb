class ApplicationMailer < ActionMailer::Base
  # ToDo: setup the sender email and send verification email on send grid
  default from: ENV['SENDGRID_SENDER'] || "FakeSender"
  layout 'mailer'
end
