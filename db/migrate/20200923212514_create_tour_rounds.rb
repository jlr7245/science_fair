class CreateTourRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_rounds do |t|
      t.references :tour

      t.timestamps
    end

    add_column :tour_visits, :tour_round_id, :integer
  end
end
