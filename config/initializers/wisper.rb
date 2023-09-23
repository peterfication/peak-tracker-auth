Rails.application.reloader.to_prepare do
  Wisper.subscribe(
    Class.new do
      def models_user_created(user)
        NewUserNotificationJobV2.perform_later({ "id" => user.id })
      end
    end.new,
    scope: User, on: :models_user_created,
  )
end
