class Audit < ApplicationRecord
  belongs_to :checklist
  has_many :answers, dependent: :destroy

  # Set up the number of displayed Audit items per page
  self.per_page = 10
end
