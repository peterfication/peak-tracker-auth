class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:root]
  before_action :redirect_if_authenticated_user!, only: [:root]

  def root
  end

  def dashboard
  end
end
