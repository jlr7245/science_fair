FactoryBot.define do
  factory :chatroom do
    site { Site.first_or_create }
    tour { Tour.first_or_create }
  end
end
