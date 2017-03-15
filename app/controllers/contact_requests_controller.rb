class ContactRequestsController < ApplicationController
  before_filter :admin_user, only: :index

  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.create(contact_params)
    redirect_to root_path
  end

  private

  def contact_params
    params.require(:contact_request).permit(
      :name,
      :email,
      :subject,
      :comment,
      :file
    )
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
