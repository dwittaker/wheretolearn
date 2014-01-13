class Add2SourcetypeIdToSources < ActiveRecord::Migration
  def up
  	#add_column :sources, references: :sourcetype
  	add_column :sources, :sourcetype_id, :integer,  references: :sourcetype
  end

  def down
  	remove_column :sources, :sourcetype_id, :integer,  references: :sourcetype
  end
end
