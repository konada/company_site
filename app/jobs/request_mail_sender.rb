class RequestMailSender < ApplicationJob
  def perform(contact_request_id)
    contact_request = ContactRequest.find(contact_request_id)
    ContactRequestMailer.request_sent(contact_request).deliver_later
  end
end
