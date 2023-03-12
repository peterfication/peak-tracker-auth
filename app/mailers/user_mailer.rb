##
# This class is responsible for sending devise emails.
class UserMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers

  self.delivery_job = MailDeliveryJob
end
