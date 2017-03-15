require 'rails_helper'

RSpec.describe ContactRequest do
  describe 'factory' do
    let(:contact_request) { FactoryGirl.create(:contact_request) }
    it 'is valid' do
      expect(contact_request).to be_valid
    end
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:subject) }
    it { is_expected.to validate_presence_of(:comment) }

    let(:invalid_contact_request) do
      FactoryGirl.build(:contact_request,
                          file: File.new("#{Rails.root}/spec/fixtures/test.gif"))
    end
    it 'invalid file is not saved' do
      expect(invalid_contact_request).not_to be_valid
    end
  end
end
