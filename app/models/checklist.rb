class Checklist < ApplicationRecord
  # Checklist can have many questions and when delete a checklist
  # the question that belongs to the specific checklist will be deleted as well. 
  has_many :questions, dependent: :destroy
  has_many :audits, dependent: :destroy
  validates :title, presence: true, length: { maximum: 40 }, uniqueness: true
  validates :description, presence: true
  
  self.per_page = 10
  
  def cout_questions
    questions.count
  end
end
