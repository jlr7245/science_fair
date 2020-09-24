FactoryBot.define do
  factory :cohort do
    name { 'test cohort' }
    starts_on { Date.today - 1.day }
    ends_on { Date.today + 1.day }
    creator { User.instructors.first }
  end
end
