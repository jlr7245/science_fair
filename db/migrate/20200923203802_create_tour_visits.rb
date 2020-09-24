class CreateTourVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_visits do |t|
      t.decimal :duration

      t.references :user
      t.references :site

      t.timestamps
    end
  end
end
