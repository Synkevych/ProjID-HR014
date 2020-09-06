class Answer < ApplicationRecord
  belongs_to :question
  validates :answer, presence: true
  validates :comment, presence: true, length: { maximum: 40 }
end
