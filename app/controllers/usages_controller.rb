class UsagesController < ApplicationController
  
  def index
    @usages = Usage.all
	end

	
  def update
    @usage = Usage.find(params[:id])
    if @usage.update(usage_params)
      redirect_to @usage
    else
      render 'edit'
    end
  end

  def show
    @usage = Usage.find(params[:id])
  end

  def new
    @usage = Usage.new
  end
  
  def edit
    @usage = Usage.find(params[:id])
  end

  def create
		@usage = Usage.new(usage_params)
    if @usage.save
      redirect_to @usage
    else
      render 'new'
    end
	end

  private
    def usage_params
      params.require(:usage).permit(:no_of_units_used, :month, :year, :feature_id, :subscription_id)
    end
end
