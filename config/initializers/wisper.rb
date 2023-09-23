Rails.application.reloader.to_prepare do
  Wisper.subscribe(NewUserNotificationJobV2, scope: User, on: :models_user_created)
end
