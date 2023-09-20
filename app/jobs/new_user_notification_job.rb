##
# A job that informs about new users.
class NewUserNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info "NewUserNotificationJob: #{args.inspect}"
  end
end
