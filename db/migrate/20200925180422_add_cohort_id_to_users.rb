class AddCohortIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cohort_id, :integer
    drop_table :cohort_memberships
  end
end
