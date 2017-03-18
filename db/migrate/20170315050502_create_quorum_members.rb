class CreateQuorumMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :quorum_members do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.references :household, foreign_key: true
      t.references :quorum, foreign_key: true

      t.timestamps
    end
  end
end
