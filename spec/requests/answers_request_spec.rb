require 'rails_helper'

RSpec.describe "Answers", type: :request do
  let(:current_user) { create(:user) }
 
  let!(:user) { current_user }
  let!(:checklist) { create(:checklist_with_questions) }
  let!(:audit) { create(:audit, checklist: checklist) }
  let(:referer) { 'http://example.com/test' }

  before { sign_in current_user }

  shared_examples "a redirect response" do
    it { expect(response.status).to eq(302) }
  end
  
  shared_examples "a success response" do
    it { expect(response.status).to eq(200) }
  end
  
  describe "POST #create" do
    let(:answer_params) do
      { answer: 'Yes', comment: 'Some comment here for test', 
        question_id: checklist.questions.first.id }
      end 
    subject { post checklist_audit_answers_path(checklist, audit, answer: answer_params) }

    context "correct params are passed" do
    end
  end

end
