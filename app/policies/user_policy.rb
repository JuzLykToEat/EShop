class UserPolicy < ApplicationPolicy

  def edit?
    user.present? && record.id == user.id
  end

  def update?
    edit?
  end
end
