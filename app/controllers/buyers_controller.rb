class BuyersController < ApplicationController
	before_action :authenticate_user!

  def index
    @plans = Plan.all
	end
	
  def show
    @subscriptions = Subscription.all
		@plans = Plan.all
	end
  
  def after_sign_out_path_for(resources)
    new_user_session_path
  end
  
  def create
    @plan = Plan.find (params[:plan_id])
    @subscription = @plan.subscriptions.new(user_id: current_user.id , plan_id: @plan.id)
    ActiveRecord::Base.transaction do
      if @subscription.save
        Transaction.create(payment_date: Date.today.day , month: Date.today.year , year: Date.today.year, resource_id: '1',resource_type: "Subscription" , charge_type: "Subscription", bill_status: "active", total_charges:@plan.fee)
        redirect_to "/buyers"
      else
        render plain: "No Subscription and No Transaction"
      end
    end
  end

  private
    
  def plan_params
    params.require(:plan).permit(:name, :fee)
  end

  def subscription_params
    params.require(:subscription).permit(:user_id, :plan_id)
  end
end
