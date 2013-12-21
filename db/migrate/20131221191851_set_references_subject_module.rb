class SetReferencesSubjectModule < ActiveRecord::Migration
  def up
  	remove_index :subject_modules, :subjectmoduleid
  	add_index :subject_modules, :subjectmoduleid, :unique => true
  end

  def down
  end
end
