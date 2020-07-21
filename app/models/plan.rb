class Plan < ApplicationRecord
	has_many :features
	has_many :subscriptions
	validates :name, presence: true
end
