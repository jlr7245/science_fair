class AddDueDate < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :due_date, :date
  end
end
