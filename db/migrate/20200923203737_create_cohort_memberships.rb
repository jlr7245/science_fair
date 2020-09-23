class CreateCohortMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :cohort_memberships do |t|
      t.references :cohort
      t.references :member

      t.timestamps
    end
  end
end
