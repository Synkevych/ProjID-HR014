class Answer < ApplicationRecord
  # Default answers for questions
  DEFAULT_ANSWER = ['Yes', 'No', 'N/A']

  belongs_to :audit
  validates :answer, presence: true
  validates :comment, presence: true, length: { minimum: 12 }
end
