class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  def set_user
    return @user if defined? @user

    @user = current_user
  end
end
