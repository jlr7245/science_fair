class Tour < ApplicationRecord
  belongs_to :project
  has_many :chatrooms

  def cohort
    project.cohort
  end

  def students
    cohort.students
  end
end
