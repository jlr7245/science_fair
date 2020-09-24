class RemoveDudTablesAndColumns < ActiveRecord::Migration[6.0]
  def change
    drop_table :tour_participants
    drop_table :tour_rounds
    remove_column :tours, :visit_type
    remove_column :tours, :cohort_id
  end
end
