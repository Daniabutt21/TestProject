class Admin < ApplicationRecord
  def make_transaction
    @users.each do |user|
      calculate_payment(user)
  end
  
  def calculate_payment(user)
    @subscription = user.subscription.find
    @plan = Plan.find(params[:@subscription.plan_id])
    plan_fee = @plan.fee
    @usage = @subscription.usages.all(@subscription.id)
    extraunits = @usage.no_of_units_used
    @feature = Feature.find(params[:@usage.feature_id])
    featureunits = @feature.mex_unit_limit
    unitprice = @feature.unit_price
    if extraunits > featureunits
      eunits = extraunits - featureunits
      feature_overuse = eunits * unitprice
      plan_fee =plan_fee+feature_overuse
    else
      plan_fee = plan_fee
    end

    Transaction.create( payment_date: user.billday  , total_charges: plan_fee  , month: @usage.month, year: @usage.year, charge_type: "Subscription" )
  end
end
