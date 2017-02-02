class ContactRequest < ApplicationRecord
  validates :name, :email, :subject, :comment, presence: true
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: allowed_formats }

  private

  def allowed_formats
    [
      'image/jpeg',
      'image/jpg',
      'image/png',
      'application/pdf',
      'application/msword',
      'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
    ]
  end
end
