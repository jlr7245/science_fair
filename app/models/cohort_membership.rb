class CohortMembership < ApplicationRecord
  belongs_to :member, class_name: 'User'
  belongs_to :cohort
end
