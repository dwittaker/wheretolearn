class RemoveCategorysFromSources < ActiveRecord::Migration
  def up
    remove_column :sources, :category1_id
    remove_column :sources, :category2_id
    remove_column :sources, :category3_id
  end

  def down
    add_column :sources, :category1_id
    add_column :sources, :category2_id
    add_column :sources, :category3_id
  end
end
