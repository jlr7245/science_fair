class Tour < ApplicationRecord
  enum visit_type: %w(visit_and_host_every_round alternate_visiting_and_hosting)

  has_many :tour_participants
  has_many :participants, though: :tour_participants, source: :user

  belongs_to :cohort
end
