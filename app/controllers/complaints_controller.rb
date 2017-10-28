class ComplaintsController < ApplicationController
  def new
    @complaint_form = ComplaintForm.new
  end

  def create
    @complaint_form = ComplaintForm.new(complaint_form_params)

    if @complaint_form.save
      redirect_to new_complaint_path
      flash[:success] =  t('.complaint_info')
    else
      render action: :new
    end
  end

    private

    def complaint_form_params
      params.require(:complaint_form).permit(:name, :product, :email, :body)
    end
end
