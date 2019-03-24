class Test < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :points, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :level, presence: true
end
