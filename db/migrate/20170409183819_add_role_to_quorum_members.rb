class AddRoleToQuorumMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :quorum_members, :role, :string, default: 'member'
    add_index :quorum_members, :role
  end
end
