class RemoveCategorysFromSubjects < ActiveRecord::Migration
  def up
    remove_column :subjects, :category1
    remove_column :subjects, :category2
    remove_column :subjects, :category3
  end

  def down
    add_column :subjects, :category1
    add_column :subjects, :category2
    add_column :subjects, :category3
  end
end
