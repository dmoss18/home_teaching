class CreateQuorums < ActiveRecord::Migration[5.0]
  def change
    create_table :quorums do |t|
      t.string :name
      t.string :quorum_type
      t.references :ward, foreign_key: true

      t.timestamps
    end
  end
end
