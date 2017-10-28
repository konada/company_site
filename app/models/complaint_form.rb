class ComplaintForm
  include ActiveModel::Model

  attr_accessor :name, :product, :email, :body, :join_mailing_list

  validates :name, :body, :product, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }

  def save
    if valid?
      ComplaintMailer.send_message(form_info).deliver_later
      true
    else
      false
    end
  end

  private

  def form_info
    { name: name, product: product, email: email, body: body }
  end
end
