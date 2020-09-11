require 'rails_helper'

RSpec.describe Question, type: :model do

  let (:checklist) { build(:checklist) }
  let (:question) { build(:question, checklist: checklist) }
  it 'has a valid factory' do
    expect(question).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:checklist)}
  end

  context "#validation" do
    it "describe title length" do 
      expect(question).to validate_length_of(:title).is_at_least(12).is_at_most(40)
    end
    it "describe description length" do 
       expect(question).to validate_presence_of(:description)
    end
  end

end
