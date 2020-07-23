class Admin < ApplicationRecord
  def self.make_payment
    User.find_each do |user|
      calculate_payment(user)
    end
  end

  private

  def calculate_payment(user)
    subscriptions = user.subscriptions
    plan = Plan.find(subscriptions.pluck(:plan_id))
    plan_fee = plan.fee
    usages = subscription.usages.all
    extraunits = usages.pluck(:no_of_units_used)
    features = Feature.find(usages.pluck(:feature_id))
    featureunits = features.pluck(:max_unit_limit)
    unitprice = features.pluck(:unit_price)
    if extraunits > featureunits
      eunits = extraunits - featureunits
      feature_overuse = eunits * unitprice
      plan_fee = plan_fee + feature_overuse
    else
      plan_fee = plan_fee
    end

    Transaction.create( payment_date: user.billday  , total_charges: plan_fee  , month: usage.month, year: usage.year, charge_type: "Subscription" )
  end
end
