class User < ApplicationRecord
  has_many :tests, dependent: :nullify
  has_many :completed_test, dependent: :destroy

  has_secure_password
end
