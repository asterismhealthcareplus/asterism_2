class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Redirect to product_status_path after user signs in
  def after_sign_in_path_for user
  	product_status_path
  end
end
