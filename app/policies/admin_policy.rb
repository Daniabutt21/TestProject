class AdminPolicy < ApplicationPolicy
 
  def update?
    return true if user.present? && user == article.user
  end
 
  def destroy?
    return true if user.present? && user == article.user
  end
 
  def update?
    user.admin? or not record.published?
  end
  
  private
 
    def article
      record
    end

end