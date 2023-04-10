class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:root]
  before_action :redirect_if_authenticated_user!, only: [:root]

  def root
    redirect_to new_user_session_path
  end

  def dashboard
    # This method is intentionally left blank
  end
end
