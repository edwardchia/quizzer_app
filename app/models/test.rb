class Test < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy
  has_many :completed_tests, dependent: :nullify

  validates :name, presence: true
end
