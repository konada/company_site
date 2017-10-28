require 'rails_helper'

RSpec.describe ComplaintForm do
  let(:complaint) { build(:complaint) }

  describe 'factory' do
    it 'is valid' do
      expect(complaint.valid?).to be_truthy
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:product) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:body) }
  end

  describe '#save' do
    it 'sends complaint form by email' do
      complaint.save
      expect(ActionMailer::DeliveryJob).to have_been_enqueued
    end
  end
end
