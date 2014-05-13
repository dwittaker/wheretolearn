class CreateUsersRoles < ActiveRecord::Migration
  def change

    rename_table :users_roles, :users_roles1

    create_table :users_roles do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps


    end
  end
end
