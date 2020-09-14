class Audit < ApplicationRecord
  belongs_to :checklist
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, reject_if: proc { |attributes| attributes['comment'].blank? }

  # Set up the number of displayed Audit items per page
  self.per_page = 10
end
