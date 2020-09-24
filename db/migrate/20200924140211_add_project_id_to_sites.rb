class AddProjectIdToSites < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :project_id, :integer
  end
end
