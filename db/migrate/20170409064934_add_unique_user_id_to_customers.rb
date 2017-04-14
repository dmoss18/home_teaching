class AddUniqueUserIdToCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_index :quorum_members, :user_id
    add_index :quorum_members, :user_id, unique: true
  end
end
