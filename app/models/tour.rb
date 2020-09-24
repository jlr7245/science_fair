class Tour < ApplicationRecord
  belongs_to :project

  def cohort
    project.cohort
  end

  def students
    cohort.students
  end
end
