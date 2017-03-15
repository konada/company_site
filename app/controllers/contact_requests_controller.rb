class ContactRequestsController < ApplicationController
  before_filter :admin_user, only: :index

  def index
    @contact_requests = ContactRequest.all
  end

  def new
    @contact_request = ContactRequest.new
  end

  def create
    @contact_request = ContactRequest.new(contact_params)
    if @contact_request.save
      redirect_to root_path
    else
      render :new
    end
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
    redirect_to(root_url) unless user_signed_in? && current_user.admin?
  end
end
