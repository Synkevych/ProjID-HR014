class Question < ApplicationRecord
  # Question belongs to a checklist
  belongs_to :checklist
  # Each Question has many answers, and when delete a question will delete the answer
  has_many :answers, dependent: :destroy
  validates :title, presence: true, length: { in: 12..40 }
  validates :description, presence: true
end
