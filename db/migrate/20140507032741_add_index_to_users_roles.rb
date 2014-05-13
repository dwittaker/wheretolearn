class AddIndexToUsersRoles < ActiveRecord::Migration
  def change
    remove_index(:users_roles1, name: 'index_users_roles_on_user_id_and_role_id')

    add_index :users_roles, [:user_id,:role_id], :unique => true
  end
end
