class ComplaintsController < ApplicationController
  def show
    @complaint_form = ComplaintForm.new
  end

  def create
    @complaint_form = ComplaintForm.new(complaint_form_params)
    if @complaint_form.save
      redirect_to complaint_path
      flash[:success] =  "Your complaint will be investigated soon!"
    else
      render action: :show
    end
  end

    private

    def complaint_form_params
      params.require(:complaint_form).permit(:name, :product, :email, :body)
    end
end
