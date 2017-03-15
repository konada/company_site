require 'rails_helper'

RSpec.describe ContactRequestsController do
  describe 'GET #new' do
    it 'assigns a new Contact to @contact_request' do
      contact_request = FactoryGirl.build(:contact_request)
        ContactRequest.stub(:new).and_return(contact_request)

        get :new

        assigns(:contact_request).should == contact_request
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new contact in the database' do
        expect {
                  post :create, contact_request: (FactoryGirl.build(:contact_request).attributes)
                }.to change(ContactRequest, :count).by(1)
      end
    end
  end
end