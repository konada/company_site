class ContactRequestPolicy < ApplicationPolicy
  def index?
    return true if user.present? && user.admin?
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    return true if user.present? && user.admin?
  end

  private

  def contact_request
    record
  end
end
