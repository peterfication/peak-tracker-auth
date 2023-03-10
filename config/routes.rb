Rails.application.routes.draw do
  root "pages#root"

  devise_for(:users, path: :auth, controllers: { sessions: "users/sessions" })
  use_doorkeeper do
    skip_controllers(
      :applications, # No admin panel needed
      # :authorizations,
      :authorized_applications, # This server is for Peak Tracker only so no need to manage authorized applications
      # :tokens,
      # :token_info,
    )
  end
  use_doorkeeper_openid_connect

  get :dashboard, to: "pages#dashboard"
end
