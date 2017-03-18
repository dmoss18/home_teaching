class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.references :quorum_member, foreign_key: true
      t.references :household, foreign_key: true
      t.string :assignment_type

      t.timestamps
    end
  end
end
