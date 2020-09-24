class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.references :site
      t.references :tour

      t.timestamps
    end
  end
end
