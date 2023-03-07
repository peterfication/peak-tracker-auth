class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?

  private

  def redirect_if_authenticated_user!
    redirect_to dashboard_path if signed_in?
  end
end
