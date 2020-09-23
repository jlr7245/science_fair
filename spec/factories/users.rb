FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "#{n}"
    end
    sequence :username do |n|
      "#{n}"
    end
    sequence :email do |n|
      "#{n}@#{n}.com"
    end
    sequence :password do |n|
      "#{n}"
    end

    trait :student do
      user_type { 'student' }
    end

    trait :instructor do
      user_type { 'instructor' }
    end
  end
end
