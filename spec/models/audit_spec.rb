require 'rails_helper'

RSpec.describe Audit, type: :model do

  let (:checklist) { build(:checklist) }
  let (:question) { build(:question, checklist: checklist) }
  let (:audit) { build(:audit, checklist: checklist) }

  it 'has a valid factory' do
    expect(audit).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:answers).dependent(:destroy) }
    it { is_expected.to belong_to(:checklist) }
  end
end
