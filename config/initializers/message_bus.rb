MessageBus.configure(backend: :memory) if Rails.env.test?

# All subscribers are registered here because they must be registered before the first publish.
# Also, it allows us to easily see all subscribers in one place.
MessageBus.subscribe "/models/user/created" do |message|
  NewUserNotificationJob.perform_later(message.data)
end
