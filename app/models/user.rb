class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :subscriptions
  validates :username, presence: true, length: { minimum: 4 ,  maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, stretches: 13
end
