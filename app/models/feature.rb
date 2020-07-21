class Feature < ApplicationRecord
  belongs_to :plan
  has_many :usage
end
