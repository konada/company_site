class ContactRequestPolicy < ApplicationPolicy
  def index?
    return true if user_admin?
  end

  def show?
    return true if user_admin?
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    return true if user_admin?
  end

  private

  def contact_request
    record
  end

  def user_admin?
    user.present? && user.admin?
  end
end
