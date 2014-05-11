class RemoveUpdatedFromUsersRoles < ActiveRecord::Migration
  def up
    remove_column :users_roles, :updated_by_id
    remove_column :users_roles, :updated_at
  end

  def down
    add_column :users_roles, :updated_by_id, :integer,  references: :user
    add_column :users_roles, :updated_at, :datetime
  end
end
