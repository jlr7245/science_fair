class CreateCohorts < ActiveRecord::Migration[6.0]
  def change
    create_table :cohorts do |t|
      t.string :name
      t.date :starts_on
      t.date :ends_on

      t.references :creator

      t.timestamps
    end
  end
end
