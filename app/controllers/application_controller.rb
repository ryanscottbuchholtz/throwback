class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :birth_month, :birth_day, :birth_year]
    devise_parameter_sanitizer.for(:account_update) << [:password, :password_confirmation, :current_password]
  end

  private

  def after_sign_up_path_for(resource)
    edit_user_path(@user)
  end

  def after_sign_in_path_for(resource)
    dashboard_index_path(@user)
  end


end
