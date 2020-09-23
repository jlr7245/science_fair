FactoryBot.define do
  factory :site do
    sequence :title do |n|
      "#{n}"
    end
    sequence :url do |n|
      "https://#{n}.com"
    end
    sequence :description do |n|
      "this is site number #{n}"
    end
    sequence :intro do |n|
      "this is site number #{n}"
    end
    sequence :github do |n|
      "https://#{n}.com"
    end
  end
end
