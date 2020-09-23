class CreateTourParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_participants do |t|
      t.boolean :is_only_hosting

      t.references :tour
      t.references :user

      t.timestamps
    end
  end
end
