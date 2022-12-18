class HomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    if current_user.present?
      redirect_to properties_path
    end
  end
end
