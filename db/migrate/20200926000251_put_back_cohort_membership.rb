class PutBackCohortMembership < ActiveRecord::Migration[6.0]
  def change
    # putting this back because instructors will teach multiple cohorts and it's really not that much added complexity
    create_table :cohort_memberships do |t|
      t.references :cohort
      t.references :member

      t.timestamps
    end

    remove_column :users, :cohort_id
  end
end
