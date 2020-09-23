class User < ApplicationRecord
  has_secure_password
  enum user_type: %w(student instructor)
  validates :username, presence: true, uniqueness: true

  scope :instructors, -> { where(user_type: 'instructor') }
  scope :students, -> { where(user_type: 'student') }
end
