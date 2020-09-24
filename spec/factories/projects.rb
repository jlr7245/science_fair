FactoryBot.define do
  factory :project do
    name { 'test project' }
    cohort { Cohort.first_or_create }
  end
end
