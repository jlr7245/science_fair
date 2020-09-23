class TourVisit < ApplicationRecord
  belongs_to :tour_round
  belongs_to :user
  belongs_to :site
end
