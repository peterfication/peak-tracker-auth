##
# No doc
class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.devise&.sender&.email
  layout "mailer"
end
