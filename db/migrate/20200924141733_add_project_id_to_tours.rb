class AddProjectIdToTours < ActiveRecord::Migration[6.0]
  def change
    add_column :tours, :project_id, :integer
  end
end
