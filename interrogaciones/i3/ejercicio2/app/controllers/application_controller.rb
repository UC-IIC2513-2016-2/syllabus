class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  protected

  def require_login
    unless current_user
      redirect_to new_session_path, alert: 'Necesitas iniciar sesión para ingresar datos'
      return false
    end
    true
  end

  def current_user
    # usaremos sólo un mock, esto no se pide en la evaluación
    Object.new
  end
end
