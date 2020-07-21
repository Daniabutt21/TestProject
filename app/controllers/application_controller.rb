class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery prepend:true
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
    
    def after_sign_in_path_for(users)
      byebug
      if current_user.usertype == "User"
        buyers_path
      else
        admins_path
      end
    end

    def after_sign_out_path_for(users)
      redirect_to 'sign_up'
    end
end
