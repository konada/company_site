class ContactRequestMailer < ApplicationMailer
   default from: "from@example.com"

    def request_sent(contact_request)
      @contact_request = contact_request

      if @contact_request.file.present?
        attachments[@contact_request.file_file_name] = File.read(@contact_request.file.path)
      end

      mail(to: @contact_request.email, subject: I18n.t('.subject'))
    end
end
