require 'rails_helper'

RSpec.describe ChecklistsController, type: :request do
  let(:current_user) { create(:user) }
 
  let!(:user) { current_user }
  let(:referer) { 'http://example.com/test' }

  before { sign_in current_user }

  shared_examples "a redirect response" do
    it { expect(response.status).to eq(302) }
  end

  shared_examples "a success response" do
    it { expect(response.status).to eq(200) }
  end

  shared_examples "not authorized error" do
    before(:each) do
      request.headers["HTTP_REFERER"] = "http://exapmpe.com/test"
      subject
    end
    it "shows not authorized flashes" do 
      expect(flash[:error]).to include("You are not authorized")
    end

    it { expect(response.location).to eq("http://exapmpe.com/test") }
    it { expect(response.status).to eq(302) }
  end

# Index 

  describe "GET #index" do
    subject { get root_path }

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
  
# Pagination Index 

  describe "GET #index pagination test" do
    let!(:checklists) { create_list(:checklist, 15) }

    context "first page with 10 checklists" do
      subject { get root_path, params: { page: 1 } }
      it "returns only 10 checklists" do
        subject
        expect(assigns(:checklists).length).to eq(10)
      end
    end

    context "second page with 5 checklists" do
      subject { get root_path params: { page: 2 } }
      it "returns only 5 checklists" do
        subject
        expect(assigns(:checklists).length).to eq(5)
      end
    end
  end

# New

  describe "GET #new" do
    subject { get new_checklist_path }
    before(:each) { subject }

    context "successful request" do
      it "returns successful response and renders new form" do
        expect(response).to render_template(:new)
      end

      it_behaves_like "a success response"

      it "sends a new checklist" do
        expect(assigns(:checklist)).to be_a(Checklist)
        expect(assigns(:checklist)).to be_a_new(Checklist)
      end
    end
  end

# Create

  describe "POST #create" do
    let(:checklist_params) do 
       { title: 'Some title with more that 14 characters', description: 'Some description' }
      end

    subject { post checklists_path(checklist: checklist_params) }
    
    context "not authorized user" do
      before(:each) do 
        sign_out user
        subject
      end

      it "has status unauthorized" do
        expect(response.status).to eq(302)
        expect(response.body).to redirect_to(new_user_session_path)
      end
    end

    context 'correct params are passed' do

      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'sets successful flash' do
        subject
        flash[:success].should =~ /Checklist was successfully created./
      end

      it 'adds new object to db' do
        expect{subject}.to change(Checklist, :count).by(1)  
      end
      it "renders new template" do
        subject
        expect(response.status).to redirect_to(checklist_path(Checklist.last))
      end
    end
  end

# Show

  describe "GET #show" do
    subject { get checklist_path(checklist) }
    before(:each) { subject }

    context "successful request - public board" do
      let(:checklist) { create(:checklist) }
      it "returns successful response  and renders show page" do
        expect(response.status).to render_template(:show)
      end

      it_behaves_like "a success response"
    end

    context "pass checklist with 6 questions" do
      let!(:checklist) { create(:checklist_with_questions) }
      it "returs checklist with 6 questions" do
        expect(assigns(:checklist).questions.length).to eq(6)
      end
    end

    context "pass checklist" do
      let(:checklist) { create(:checklist) }
      it "returs valid checklist" do
        expect(assigns(:checklist)).to be_a(Checklist)
        expect(assigns(:checklist)).to eq(checklist)
      end
    end
  end

# Destroy

  describe "DELETE #destroy" do
    subject { delete checklist_path(checklist) }

    let!(:checklist) { create(:checklist) }
    
    context 'correct params are passed' do  
      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end

      it 'has successful redirect' do
        subject
        expect(response.body).to redirect_to(checklists_path)
      end

      it 'sets successful flash' do
        subject
        flash[:success].should =~ /Checklist was successfully destroyed./
      end

      it 'delete object from db' do
        expect{subject}.to change(Checklist, :count).by(-1)
      end
    end
  end

end
