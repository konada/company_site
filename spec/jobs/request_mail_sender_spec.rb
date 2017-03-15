require 'rails_helper'

RSpec.describe RequestMailSender do
  include ActiveJob::TestHelper

  describe '#perform' do
    it 'sends an email' do
      expect do
        perform_enqueued_jobs do
          FactoryGirl.create(:contact_request)
        end
      end.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
