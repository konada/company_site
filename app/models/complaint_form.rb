class ComplaintForm
  include ActiveModel::Model

  attr_accessor :name, :product, :email, :body, :join_mailing_list

  validates :name, :body, :product, presence: true
  validates :email, presence: true, format: { with: Devise.email_regexp }

  def save
    if valid?
      ComplaintMailer.message(email).deliver_later
      true
    else
      false
    end
  end
end
