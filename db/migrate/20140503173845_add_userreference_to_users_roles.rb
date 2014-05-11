class AddUserreferenceToUsersRoles < ActiveRecord::Migration
  def up

    add_column :users_roles, :created_by_id, :integer,  references: :user
    add_column :users_roles, :updated_by_id, :integer,  references: :user

    add_column :users_roles, :created_at, :datetime
    add_column :users_roles, :updated_at, :datetime

  end

  def down

    remove_column :users_roles, :created_by_id, :integer,  references: :user
    remove_column :users_roles, :updated_by_id, :integer,  references: :user

    remove_column :users_roles, :created_at, :datetime
    remove_column :users_roles, :updated_at, :datetime

  end
end
