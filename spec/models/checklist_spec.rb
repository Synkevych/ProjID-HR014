require 'rails_helper'

RSpec.describe Checklist, type: :model do
  
  let (:checklist) { build(:checklist) }

  it 'has a valid factory' do
    expect(build(:checklist)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { is_expected.to have_many(:audits).dependent(:destroy) }
  end

  describe 'validations' do
    context 'name' do
      it { is_expected.to have_db_column(:title).of_type(:string) }
      it { is_expected.to validate_length_of(:description).is_at_least(1).is_at_most(40) }
      it { is_expected.to have_db_column(:publish).of_type(:bolean) }
    end
  end

end
