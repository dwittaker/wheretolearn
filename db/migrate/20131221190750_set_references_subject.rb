class SetReferencesSubject < ActiveRecord::Migration
  def up
  	remove_column :subject_modules, :moduleid
  	remove_index :subjects, :subjectid
  	add_index :subjects, :subjectid, :unique => true
  end

  def down
  end
end
