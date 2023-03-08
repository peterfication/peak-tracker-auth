Rails.application.routes.draw do
  root "pages#root"

  devise_for(:users, path: :auth, controllers: { sessions: "users/sessions" })

  get :dashboard, to: "pages#dashboard"
end
