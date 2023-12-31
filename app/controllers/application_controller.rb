class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user) 
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password)} 
  end
end

