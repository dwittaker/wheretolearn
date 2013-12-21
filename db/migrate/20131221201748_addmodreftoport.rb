class Addmodreftoport < ActiveRecord::Migration
  def up
  	rename_column :portfolios, :moduleid, :subjectmoduleid
  	add_index :portfolios, :portfolioid, :unique => true
  	add_column :sources, :source_id, :integer
  	add_index :sources, :source_id, :unique => true
  	rename_column :portfolios, :sourceid, :source_id
  end

  def down
  end
end
