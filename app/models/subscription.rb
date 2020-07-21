class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :usage
end
