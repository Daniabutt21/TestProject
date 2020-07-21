class BuyerPolicy < ApplicationPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end
	def index
		user.user?
  end
  def show
    user.user?
  end
end