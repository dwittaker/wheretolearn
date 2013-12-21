class AddSubjectsRefToSubjectModules < ActiveRecord::Migration
  def change

  	add_index :subjects, :subjectid
  	add_index :subject_modules, :subjectmoduleid
    #add_column :subject_modules, references: :subject
  end
end
