class BuyersController < ApplicationController
	def index
    @plans = Plan.all
	end
	def show
		@plans = Plan.all
	end
  private
    def plan_params
      params.require(:plan).permit(:name, :fee)
    end
end
