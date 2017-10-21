class ContactRequest < ApplicationRecord
  scope :by_subject, ->(direction) { order subject: direction }
  scope :by_date, ->(direction) { order created_at: direction }
  scope :by_author, ->(direction) { order name: direction}

  validates :name, :email, :subject, :comment, presence: true
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_format_of :name,
                      with: /\A(?=.* )[^0-9`!@#\\\$%\^&*\;+_=]{4,}\z/i

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

  belongs_to :user, optional: true

  private

  def send_email
    RequestMailSender.perform_later(id)
  end
end
