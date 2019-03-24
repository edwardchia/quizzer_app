class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :description, presence: true
  validates :solution_id, presence: true, numericality: { greater_than_or_equal_to: 1 }
end
