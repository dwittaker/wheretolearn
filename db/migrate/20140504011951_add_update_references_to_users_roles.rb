class AddUpdateReferencesToUsersRoles < ActiveRecord::Migration
  def change
    add_column :users_roles, :created_by_id, :integer,  references: :user
    add_column :users_roles, :updated_by_id, :integer,  references: :user

    add_index :users_roles, :created_by_id
    add_index :users_roles, :updated_by_id

  end
end
