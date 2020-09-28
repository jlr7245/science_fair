class Cohort < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :cohort_memberships
  has_many :members, class_name: 'User', through: :cohort_memberships
  has_many :projects
  has_many :tours, through: :projects

  def students
    members.where(user_type: 'student')
  end

  def instructors
    members.where(user_type: 'instructor')
  end

  def signup_link(base)
    "#{base}?cohort_id=#{id}"
  end
end
