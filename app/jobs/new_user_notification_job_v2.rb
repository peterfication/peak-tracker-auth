##
# A job that informs about new users.
class NewUserNotificationJobV2 < ApplicationJob
  queue_as :default

  ##
  # Listener method for wisper which is called in config/initializers/wisper.rb
  def self.models_user_created(user_id)
    NewUserNotificationJobV2.perform_later({ "id" => user_id })
  end

  def perform(*args)
    Rails.logger.info "New user available: #{args.inspect}"
  end
end
