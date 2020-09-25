MODELS = %w(user cohort site tour cohort_membership chatroom message tour_visit tour_participant)

def make_filepath(m)
  "#{Rails.root}/app/models/#{m}.rb"
end

namespace :models do
  desc "create the models"
  task :create => [:environment] do
    MODELS.each do |m|
      File.open(make_filepath(m), 'w') do |f|
        f.write <<-STR
class #{m.camelize} < ApplicationRecord
end
        STR
      end
    end
  end

  desc "remove the models"
  task :remove => [:environment] do
    MODELS.each do |m|
      system("rm #{file(m)}")
    end
  end

  desc "sample workflow"
  task :workflow => [:environment] do
    [Cohort, User, Site, Project, Tour, TourVisit,].each(&:destroy_all)

    # instructor creates a cohort
    instructor = FactoryBot.create(:user, :instructor)
    cohort = FactoryBot.create(:cohort, creator: instructor)
    instructor.cohorts << cohort

    # students sign up for the cohort
    6.times do
      student = FactoryBot.create(:user, :student)
      student.cohorts << cohort
    end

    # instructor creates a project for this cohort
    project = FactoryBot.create(:project, cohort: cohort)

    # students each submit a site for the project
    project.students.each do |student|
      site = FactoryBot.create(:site, student: student, project: project)
    end

    # once all site submissions are in, instructor creates a tour for this project
    # create all the chatrooms for this tour
    # one per site
    tour = BuildTour.new({
      project: project,
      name: 'test tour',
      date: Date.today,
    })

    # students will visit each other's sites
    tour.students.each do |student|
      vsh = VisitSiteHelper.new({
        visitor: student,
        tour: tour
      })

      while vsh.sites_left_to_visit.any?
        site = vsh.visit_next_site!

        # students leave a message in the chatroom of the sites they visit
        CreateMessageHelper.create_message!({
          tour: tour,
          user: student,
          site: site,
          content: 'test',
        })
      end
    end
  end

  desc "test the tour builder"
  task :build_tour => [:environment] do

  end
end
