class AddUserreferenceToPortfolio < ActiveRecord::Migration
  def up

    add_column :portfolios, :created_by_id, :integer,  references: :user
    add_column :portfolios, :updated_by_id, :integer,  references: :user

    add_column :subjects, :created_by_id, :integer,  references: :user
    add_column :subjects, :updated_by_id, :integer,  references: :user

    add_column :subject_modules, :created_by_id, :integer,  references: :user
    add_column :subject_modules, :updated_by_id, :integer,  references: :user

    add_column :sources, :created_by_id, :integer,  references: :user
    add_column :sources, :updated_by_id, :integer,  references: :user

    add_index :portfolios, :created_by_id
    add_index :portfolios, :updated_by_id

    add_index :subjects, :created_by_id
    add_index :subjects, :updated_by_id

    add_index :subject_modules, :created_by_id
    add_index :subject_modules, :updated_by_id

    add_index :sources, :created_by_id
    add_index :sources, :updated_by_id


  end




  def down

    remove_column :portfolios, :created_by_id, :integer,  references: :user
    remove_column :portfolios, :updated_by_id, :integer,  references: :user

    remove_column :subjects, :created_by_id, :integer,  references: :user
    remove_column :subjects, :updated_by_id, :integer,  references: :user

    remove_column :subject_modules, :created_by_id, :integer,  references: :user
    remove_column :subject_modules, :updated_by_id, :integer,  references: :user

    remove_column :sources, :created_by_id, :integer,  references: :user
    remove_column :sources, :updated_by_id, :integer,  references: :user


  end
end
