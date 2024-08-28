class ArticlePolicy < ApplicationPolicy
  def update?
    user.admin? || user == record.user
  end

  def destroy?
    user.admin?
  end
end
