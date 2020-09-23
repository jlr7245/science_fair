class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.string :title
      t.string :url
      t.string :description
      t.string :intro
      t.string :github

      t.references :user

      t.timestamps
    end
  end
end
