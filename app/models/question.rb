class Question < ApplicationRecord
  # Question belongs to a checklist
  belongs_to :checklist
  
  validates :title, presence: true, length: { in: 12..40 }, uniqueness: true
  validates :description, presence: true
end
