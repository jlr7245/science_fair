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
    [Cohort, User, Site,].each(&:destroy_all)

    instructor = FactoryBot.create(:user, :instructor)
    cohort = FactoryBot.create(:cohort, creator: instructor)

    6.times do
      student = FactoryBot.create(:user, :student)
      site = FactoryBot.create(:site, student: student)
    end


  end
end

