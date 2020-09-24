class Project < ApplicationRecord
  belongs_to :cohort
  has_many :members, through: :cohort
  has_many :sites
  has_many :tours

  def students
    members.where(user_type: 'student')
  end

  def instructors
    members.where(user_type: 'instructor')
  end
end
