require 'rails_helper'

RSpec.describe ChecklistsController, type: :request do
  let(:current_user) { create(:user) }

  let!(:user) { current_user }

  before do
    sign_in current_user
  end
  
  shared_examples "a redirect response" do
    it { expect(response.status).to eq(302) }
  end
  
  describe "GET #index" do
    subject { get :index }
    let!(:checklists) { create(:checklist) }

    context "user doesn't exist" do
      before(:each) do 
        sign_out current_user
        subject
      end
      it "redirects to login page" do
        expect(response.status).to redirect_to new_user_session_path
      end
      it_behaves_like "a redirect response"
    end

    context "user exists" do
      before(:each) { subject }
      it "returns successful response and renders index page" do
        expect(response.status).to render_template(:index)
      end
    end

  end

end
