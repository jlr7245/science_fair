class TourVisit < ApplicationRecord
  belongs_to :user
  belongs_to :site
  belongs_to :tour

  scope :for_visitor_and_tour, lambda { |visitor, tour| where(user: visitor, tour: tour) }
  scope :most_recent, -> { order(:created_at).last }
  scope :current_for_visitor_and_tour, lambda { |visitor, tour| for_visitor_and_tour(visitor, tour).most_recent }

  def conclude!
    update(concluded_at: Time.now)
  end
end
