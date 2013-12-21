class AddColumnstosubjects < ActiveRecord::Migration
  def change
  
      add_column :subjects,  :subjectid, :integer
      add_column :subjects,  :purpose, :string
      add_column :subjects,  :complexity, :decimal, precision: 5, scale:2
      add_column :subjects,  :category1, :integer
      add_column :subjects,  :category2, :integer
      add_column :subjects,  :category3, :integer
      add_column :subjects,  :avgtimetolearn, :integer
      
  
  end

end
