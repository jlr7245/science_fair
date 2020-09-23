class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username, index: true
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :user_type
      
      t.timestamps
    end
  end
end
