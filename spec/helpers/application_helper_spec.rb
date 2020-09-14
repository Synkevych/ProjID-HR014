require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "#get_pages_info" do
    it "return correct number of pages and endries"  do
      expect(helper.get_pages_info(1, 2)).to eq("Showing 1 to 10 of 2 entries")
    end
    it "return correct number of pages and endries"  do
      expect(helper.get_pages_info(2, 2)).to eq("Showing 11 to 20 of 2 entries")
    end
  end
end
