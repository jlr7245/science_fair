class TourRound < ApplicationRecord
  belongs_to :tour
  has_many :tour_visits
end
