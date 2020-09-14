require 'rails_helper'

RSpec.describe "Questions", type: :request do
  let(:current_user) { create(:user) }
 
  let!(:user) { current_user }
  let!(:checklist) { create(:checklist) }
  let(:referer) { 'http://example.com/test' }

  before { sign_in current_user }

# Create 

  describe "POST #create" do
    let(:question_params) do
      { title: "How you create this app", description: "What technology do they use"}
    end
    subject { post checklist_questions_path(checklist, question: question_params) }

    context "correct params are passed" do

      it 'has successful status' do
        subject
        expect(response.status).to eq(302)
      end
      
      it 'sets successful flash' do
        subject
        flash[:success].should =~ /Question was successfully created./
      end
      
      it 'adds new object to db' do
        expect{subject}.to change(Question, :count).by(1)  
      end

      it "renders new template" do
        subject
        expect(response.status).to redirect_to(checklist_path(Checklist.last))
      end
    end
  end
end
