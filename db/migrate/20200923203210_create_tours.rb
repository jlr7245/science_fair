class CreateTours < ActiveRecord::Migration[6.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.date :date

      t.integer :visit_type

      t.references :cohort

      t.timestamps
    end
  end
end
