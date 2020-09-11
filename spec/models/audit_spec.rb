require 'rails_helper'

RSpec.describe Audit, type: :model do

  let (:audit) { build(:audit) }

  it 'has a valid factory' do
    expect(build(:audit)).to be_valid
  end

  describe 'associations' do
    it { is_expected.to have_many(:answers).dependent(:destroy) }
    it { is_expected.to belong_to(:checklist) }
  end
end
