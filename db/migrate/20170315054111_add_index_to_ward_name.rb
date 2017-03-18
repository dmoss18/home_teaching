class AddIndexToWardName < ActiveRecord::Migration[5.0]
  def change
    add_index :wards, :name, unique: true
    add_index :quorums, [:name, :ward_id], unique: true
    add_index :households, [:name, :ward_id], unique: true
    add_index :assignments, [:quorum_member_id, :household_id], unique: true
  end
end
