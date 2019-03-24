class User < ApplicationRecord
  has_many :tests, dependent: :nullify
  has_many :completed_test, dependent: :destroy

  has_secure_password

  # this verifies that the email is valid
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end
end
