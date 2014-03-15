class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Redirect to product_status_path after user signs in
  def after_sign_in_path_for user
  	product_status_path
  end

  # Configure attributes that users may access in order to sign up or update their account
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name << :office_location << :office_country << :office_city << :company
  	devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :office_location << :office_country << :office_city << :company
  end
end
