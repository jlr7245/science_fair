class ReplaceDurationWithConcludedAt < ActiveRecord::Migration[6.0]
  def change
    remove_column :tour_visits, :duration
    add_column :tour_visits, :concluded_at, :datetime
  end
end
