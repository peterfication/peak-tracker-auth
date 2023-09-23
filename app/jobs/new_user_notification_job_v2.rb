##
# A job that informs about new users.
class NewUserNotificationJobV2 < ApplicationJob
  queue_as :default

  def self.models_user_created(user)
    NewUserNotificationJobV2.perform_later({ "id" => user.id })
  end

  def perform(*args)
    Rails.logger.info "New user available: #{args.inspect}"
  end
end
