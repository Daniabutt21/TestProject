class TransactionsController < ApplicationController
  def index
  	@user = User.find(params[:user_id])
  	@transactions =@user.transactions.all
  end

  def show
  
  end
  private
    def transaction_params
      params.require(:transaction).permit(:payment_date, :total_charges, :bill_status, :resource_id, :resource_type, :charge_type, :month, :year , :user_id)
    end
end
