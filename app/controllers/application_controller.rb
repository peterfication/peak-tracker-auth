class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  private

  ##
  # Redirects the user to the dashboard if they are already signed in.
  def redirect_if_authenticated_user!
    redirect_to dashboard_path if signed_in?
  end
end
