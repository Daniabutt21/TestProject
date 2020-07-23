class AdminPolicy < ApplicationPolicy
 
  def make_payment
    user.admin?
  end
  
  
  private
 
    def article
      record
    end

end