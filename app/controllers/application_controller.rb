class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery 
	include Pundit
  #rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index
  
  protected

  def configure_permitted_parameters
  added_attrs = [:username, :email, :password, :password_confirmation, :billday, :usertype]
	devise_parameter_sanitizer.permit :sign_up, keys: added_attrs 
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  def after_sign_in_path_for(resource)
    if current_user.usertype == "User"
      buyer_path(current_user.id)
    else
      admins_path
    end
  end

  #rescue_from Pundit::NotAuthorizedError do 
   # redirect_to root_url , alert: "You do not have access to this page"  
  #end
end
