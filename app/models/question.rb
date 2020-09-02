class Question < ApplicationRecord
  belongs_to :checklist
  validates :title, presence: true, length: { in: 12..40 }
  validates :description, presence: true
end
