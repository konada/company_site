class ComplaintMailer < ApplicationMailer
   default from: "from@example.com"

    def message(email)
      mail(to: email, subject: I18n.t('.subject'))
    end
end
