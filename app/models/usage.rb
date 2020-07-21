class Usage < ApplicationRecord
	belongs_to :feature
  belongs_to :subscription
  validates :no_of_units_used, presence: true
end
