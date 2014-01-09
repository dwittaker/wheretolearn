class RemoveCategory4FromSubjectmodule < ActiveRecord::Migration
  def up
    remove_column :subject_modules, :category4
    remove_column :subject_modules, :category5
  end

  def down
    add_column :subject_modules, :category5, :integer
    add_column :subject_modules, :category4, :integer
  end
end
