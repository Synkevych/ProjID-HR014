class Checklist < ApplicationRecord
  has_many :questions, dependent: :destroy
  validates :title, presence: true, length: { maximum: 40 }
  validates :description, presence: true
  
  self.per_page = 10
end
