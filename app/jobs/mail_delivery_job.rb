##
# The MailDeliveryJob but with log_arguments set to false.
class MailDeliveryJob < ActionMailer::MailDeliveryJob
  self.log_arguments = false
end
