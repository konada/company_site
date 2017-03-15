class ContactRequest < ApplicationRecord
  validates :name, :email, :subject, :comment, presence: true
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_attached_file :file
  validates_attachment :file,
                       content_type:
                        {
                          content_type: [
                            'image/jpeg',
                            'image/jpg',
                            'image/png',
                            'application/pdf',
                            'application/msword',
                            'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
                          ]
                        }
  after_save :send_email

  private

  def send_email
    RequestMailSender.perform_later(id)
  end
end
