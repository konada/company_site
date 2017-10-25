class ContactRequestsController < ApplicationController
  before_action :set_contact_request, only: [:show, :update, :destroy]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @contact_requests = OrderedContactRequestsQuery.new(sort_query_params).all.page(params[:page]).per(6)
    authorize @contact_requests
  end

  def show
    @user = @contact_request.user || NullUser.new
  end

  def new
    @contact_request = ContactRequest.new
    authorize @contact_request
  end

  def edit
  end

  def create
    @contact_request = ContactRequest.new(contact_params)
    @contact_request.user = current_user if current_user
    authorize @contact_request
    if @contact_request.save
      redirect_to root_path
      flash[:success] = 'Contact request was successfully created.'
    else
      render 'new'
    end
  end

  def destroy
    @contact_request.destroy
    redirect_to admin_path
    flash[:success] = 'Contact request was successfully destroyed.'
  end

  private

  def contact_params
    params.require(:contact_request).permit(
      :name,
      :email,
      :subject,
      :comment,
      :file,
      :user_id
    )
  end

  def set_contact_request
    @contact_request = ContactRequest.find(params[:id])
    authorize @contact_request
  end

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def sort_query_params
    params.slice(:sort_by, :direction)
  end
end
