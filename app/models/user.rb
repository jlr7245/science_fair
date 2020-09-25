class User < ApplicationRecord
  module UserTypes
    STUDENT = 'student'
    INSTRUCTOR = 'instructor'
  end

  validates :username, presence: true, uniqueness: true

  enum user_type: [
    UserTypes::STUDENT,
    UserTypes::INSTRUCTOR
  ]

  has_many :cohort_memberships, foreign_key: :member_id
  has_many :cohorts, through: :cohort_memberships

  has_one :site
  has_many :tour_visits

  has_secure_password

  scope :instructors, -> { where(user_type: UserTypes::INSTRUCTOR) }
  scope :students, -> { where(user_type: UserTypes::STUDENT) }

  def is_instructor?
    user_type == UserTypes::INSTRUCTOR
  end
end
