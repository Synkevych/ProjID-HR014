class Answer < ApplicationRecord
  DEFAULT_ANSWER = ['Yes', 'No', 'N/A']
  belongs_to :audit
  validates :answer, presence: true
  validates :comment, presence: true, length: { maximum: 40 }
end
