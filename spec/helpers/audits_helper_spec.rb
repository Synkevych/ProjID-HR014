require 'rails_helper'

RSpec.describe AuditsHelper, type: :helper do

  describe "#get_row_number" do
    it "return correct row number for first audit page"  do
      expect(helper.get_row_number(1, 1)).to eq(2)
    end
    it "return correct row number for second audit page"  do
      expect(helper.get_row_number(2, 0)).to eq(11)
    end
    
    it "return correct row number for third audit page"  do
      expect(helper.get_row_number(3, 5)).to eq(26)
    end
  end
end
