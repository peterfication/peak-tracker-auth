Rails.application.routes.draw do
  root "pages#root"

  devise_for(:users, path: :auth, controllers: { sessions: "users/sessions" })
  use_doorkeeper do
    # TODO: Skip not needed controllers
    #
    # it accepts :authorizations, :tokens, :token_info, :applications and :authorized_applications
    # skip_controllers :tokens, :applications, :token_info
  end
  use_doorkeeper_openid_connect

  get :dashboard, to: "pages#dashboard"
end
