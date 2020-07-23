class AdminsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@users = User.all
  end
  
  def show
    @users = User.all
  end
  
  def charge_user
    Admin.make_payment
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(admin_params)
    if @user.save
      if @user.usertype = 'User'
        render "buyers/show"
      else
        redirect_to @admin
      end
    else
      render plain: "Not Successfully Registered"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
   #redirect_to 'devise/session/user'
  end

  private
    def admin_params
      params.require(:user).permit(:email, :username, :billday)
    end
end
