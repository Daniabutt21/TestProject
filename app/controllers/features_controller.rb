class FeaturesController < ApplicationController
  def index
    @plan = Plan.find(params[:plan_id])
  	@features = @plan.features.all
  end
  def new
    
    @plan = Plan.find(params[:plan_id])
    @feature = Feature.new
  end
  def update
    @feature = Feature.find(params[:id])
    if @feature.update(feature_params)
      redirect_to @feature
    else
      render 'edit'
    end
  end
  def home
    @feature = Feature.find(params[:id])
  end

  def show
    @plan = Plan.find(params[:plan_id])
    @feature = Feature.find(params[:id])
  end
  
  def create
    
  	@plan = Plan.find(params[:plan_id])
  	@feature = @plan.features.create(feature_params)
	  redirect_to plan_path(@plan)
  end

  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to features_path
  end

  private
    def feature_params
      params.require(:feature).permit(:name, :code, :unit_price, :max_unit_limit, :plan_id)
    end
end
