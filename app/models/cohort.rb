class Cohort < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :members, class_name: 'User'

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
