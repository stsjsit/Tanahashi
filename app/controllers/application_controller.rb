class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters,if: :devise_controller?
  
  protected
  def configure_permitted_parameters
    #sign_up時name,age許可
    devise_parameter_sanitizer.permit :sign_up,keys: [:name, :age]
    
    #account_update時name,age許可
    devise_parameter_sanitizer.permit :account_update,keys: [:name, :age]
  end
end
