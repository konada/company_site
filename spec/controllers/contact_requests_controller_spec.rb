require 'rails_helper'

RSpec.describe ContactRequestsController do
  let!(:user) { create(:user) }
  let!(:admin) { create(:user, :admin) }

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

  describe 'GET #index' do
    context 'admin logged in' do
      it "should see all the posts" do
        sign_in :user, admin
        get :index
        expect(response).to render_template(:index)
      end
    end

    context 'normal user logged in' do
      it "should not have an access to index" do
        sign_in :user, user
        get :index
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
