##
# A job that informs about new users.
class NewUserNotificationJobV2 < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info "New user available: #{args.inspect}"
  end
end
