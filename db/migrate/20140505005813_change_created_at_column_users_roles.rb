class ChangeCreatedAtColumnUsersRoles < ActiveRecord::Migration
  def up
    change_column_null :users_roles, :created_at, true
  end

  def down
    change_column_null :users_roles, :created_at, false
  end
end
