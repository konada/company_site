require 'rails_helper'

RSpec.describe ContactRequestMailer do
  let(:contact_request) { FactoryGirl.create(:contact_request) }
  let(:message) { ActionMailer::Base.deliveries.last }

  describe '#request_sent' do
    before do
      ActionMailer::Base.deliveries = []
      described_class.request_sent(contact_request).deliver_now
    end

    it 'renders the subject' do
      expect(message.subject).to eq(I18n.t('.subject'))
    end

    it 'renders the receiver email' do
      expect(message.to).to eq([contact_request.email])
    end

    it 'renders the sender email' do
      expect(message.from).to eq(['from@example.com'])
    end

    it 'sends the attachment' do
      expect(message.attachments.last.filename).to eq(contact_request.file_file_name)
    end
  end
end
