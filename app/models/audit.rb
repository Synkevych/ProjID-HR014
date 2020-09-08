class Audit < ApplicationRecord
  belongs_to :checklist
  has_many :answers, dependent: :destroy
end
