class SubscriptionsController < ApplicationController
	before_action :authenticate_user!
  def index
    @user = User.find (params[:user_id])
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

  def show
    @plan = Plan.find(params[:plan_id])
    @subscription = Subscription.find(params[:id])
  end
  
  def new
    @subscription = Subscription.new(subscription_params)
  end
  
  def edit
    @subscription = Subscription.find(params[:id])
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy
    redirect_to plan_subscriptions_path(@plan)
  end  

  private
    def subscription_params
      params.require(:subscription).permit(:user_id, :plan_id)
    end
end
