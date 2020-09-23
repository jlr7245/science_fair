class Cohort < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :cohort_memberships
  has_many :members, through: :cohort_memberships

  def students
    members.where(user_type: 'student')
  end

  def instructors
    members.where(user_type: 'instructor')
  end
end
