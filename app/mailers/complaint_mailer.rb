class ComplaintMailer < ApplicationMailer
  default from: "from@example.com"

  def send_message(complaint_info)
    @complaint = complaint_info

    mail(to: complaint_info[:email],
         bcc: User.where(admin: true).pluck(:email),
         subject: I18n.t('.mail_subject'))
  end
end
