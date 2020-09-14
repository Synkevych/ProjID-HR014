require 'rails_helper'

RSpec.describe "Audits", type: :request do
  
  let!(:user) { create(:user) }
  let!(:checklist) { create(:checklist) }
  let(:referer) { 'http://example.com/test' }

  before { sign_in user }

  shared_examples "a redirect response" do
    it { expect(response.status).to eq(302) }
  end

  shared_examples "an unprocessable entity response" do
    it { expect(response.status).to eq(422) }
  end

  shared_examples "a success response" do
    it { expect(response.status).to eq(200) }
  end

  shared_examples "not authorized error" do
    let!(:user) { create(:user) }
    let(:checklist) {create(:checklist)}

    before(:each) do
      subject
    end
    it "shows not authorized flashes" do 
      expect(flash[:error]).to include("You are not authorized")
    end

    it { expect(response.location).to eq(referer) }
    it { expect(response.status).to eq(302) }
  end

# Index 

  describe "GET #index" do
    subject { get checklists_path }
    let!(:audit) { create(:audit, checklist: checklist) }

    context "user doesn't exist" do
      before(:each) do 
        sign_out user
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

# New 

  describe "GET #new" do
    subject { get new_checklist_audit_path(checklist) }
    before(:each) { subject }

    context "successful request" do
     before(:each) { subject }
      it 'has successful status' do
        subject
        expect(response.status).to eq(200)
      end
      it "returns successful response and renders new form" do
        expect(response).to render_template(:new)
      end

      it_behaves_like "a success response"

      it "sends a new audit" do
        expect(assigns(:audit)).to be_a(Audit)
      end

      # it 'adds new object to db' do
      #   expect{subject}.to change(Audit, :count).by(1)  
      # end
    end
  end

# Destroy 

  describe "DELETE #destroy" do
    subject { delete checklist_audit_path(checklist, audit) }

    let!(:audit) { create(:audit, checklist: checklist) }
    
    context 'correct params are passed' do  
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'has successful redirect' do
        subject
        expect(response.body).to redirect_to(audits_path)
      end

      it 'delete object from db' do
        expect{subject}.to change(Audit, :count).by(-1)
      end
    end
  end
end
