class User < ApplicationRecord
  has_secure_password

  enum user_type: %w(student instructor)

  validates :username, presence: true, uniqueness: true

  scope :instructors, -> { where(user_type: 'instructor') }
  scope :students, -> { where(user_type: 'student') }

  has_many :cohort_memberships
  has_many :cohorts, through: :cohort_memberships

  has_one :site
end
