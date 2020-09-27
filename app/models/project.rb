class Project < ApplicationRecord
  belongs_to :cohort
  has_many :members, class_name: "User", through: :cohort
  has_many :sites
  has_many :tours

  def students
    members.where(user_type: 'student')
  end

  def instructors
    members.where(user_type: 'instructor')
  end

  # def self.sort_by_cohort(projects)
  #   projects.reduce({}) do |acc, project|
  #     name = project.cohort.name
  #     if acc[name]
  #       acc[name] << project
  #     else
  #       acc[name] = [project]
  #     end
  #     return acc
  #   end
  #  end

  # def user_site(current_user)
  #   self.sites.find { |site| site.student == current_user }
  # end
end
