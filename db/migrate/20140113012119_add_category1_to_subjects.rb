class AddCategory1ToSubjects < ActiveRecord::Migration

  def up
  	
  	add_column :sources, :category1_id, :integer,  references: :category1 
  	add_column :sources, :category2_id, :integer,  references: :category2
  	add_column :sources, :category3_id, :integer,  references: :category3
  end

  def down
  	
  	remove_column :sources, :category1_id, :integer,  references: :category1 
  	remove_column :sources, :category2_id, :integer,  references: :category2
  	remove_column :sources, :category3_id, :integer,  references: :category3
  end
end
