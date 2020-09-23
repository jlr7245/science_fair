class Tour < ApplicationRecord
  enum visit_type: %w(split_host_and_visit all_host_and_visit)

  has_many :tour_participants
  has_many :participants, though: :tour_participants, source: :user

  belongs_to :cohort
end
