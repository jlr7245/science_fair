class TourVisit < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :tour

  scope :for_visitor_and_tour, lambda { |visitor, tour| where(user: visitor, tour: tour) }
end
