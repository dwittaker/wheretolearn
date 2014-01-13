class AddCategory2ToSubjects < ActiveRecord::Migration
    def up
  	
  	add_column :subjects, :category1_id, :integer,  references: :category1 
  	add_column :subjects, :category2_id, :integer,  references: :category2
  	add_column :subjects, :category3_id, :integer,  references: :category3
  end

  def down
  	
  	remove_column :subjects, :category1_id, :integer,  references: :category1 
  	remove_column :subjects, :category2_id, :integer,  references: :category2
  	remove_column :subjects, :category3_id, :integer,  references: :category3
  end
end
