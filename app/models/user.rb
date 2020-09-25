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

  belongs_to :cohort

  has_one :site
  has_many :tour_visits

  has_secure_password

  scope :instructors, -> { where(user_type: UserTypes::INSTRUCTOR) }
  scope :students, -> { where(user_type: UserTypes::STUDENT) }

  def is_instructor?
    user_type == UserTypes::INSTRUCTOR
  end
end
