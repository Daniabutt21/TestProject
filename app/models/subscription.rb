class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :usages , dependent: :destroy

  after_create :send_user_mail

  def send_user_mail
  	UserMailer.send_welcome_email(self).deliver_later
  end
end
