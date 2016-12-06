class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    User.first
  end
end
