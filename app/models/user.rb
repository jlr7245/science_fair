class User < ApplicationRecord
  # this is here to allow for students to sign up with a cohort
  attr_accessor :cohort_id

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
  has_many :cohorts, through: :cohort_memberships, foreign_key: :member_id
  has_many :projects, through: :cohorts
  has_many :tours, through: :cohorts

  has_one :site
  has_many :tour_visits

  has_secure_password

  scope :instructors, -> { where(user_type: UserTypes::INSTRUCTOR) }
  scope :students, -> { where(user_type: UserTypes::STUDENT) }

  def is_instructor?
    user_type == UserTypes::INSTRUCTOR
  end

  def is_student?
    user_type == UserTypes::STUDENT
  end

  def active_tour
    tours.where(date: Date.today).first
  end
end
