class ReplaceTourRoundIdWithTourId < ActiveRecord::Migration[6.0]
  def change
    remove_column :tour_visits, :tour_round_id
    add_column :tour_visits, :tour_id, :integer
  end
end
