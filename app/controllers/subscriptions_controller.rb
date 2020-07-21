class SubscriptionsController < ApplicationController
	def index
    @plan = Plan.find (params[:plan_id])
    @subscriptions = @plan.subscriptions.all
	end
	
  def create
    @plan = Plan.find (params[:plan_id])
		@subscription = Subscription.new(subscription_params)
		if @subscription.save
		  redirect_to plan_subscriptions_path(@plan)
    else
      render 'new'
    end
	end

  def update
    @subscription = Subscription.find(params[:id])
    if @subscription.update(subscription_params)
      redirect_to plan_subscriptions_path
    else
      render 'edit'
    end
  end
  
  def show
    @subscription = Subscription.find(params[:id])
  end
  
  def new
    @plan = Plan.find (params[:plan_id])
    
    @subscription = Subscription.new
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
