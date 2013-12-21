class RemoveSubjectIdFromSubjects < ActiveRecord::Migration
  def up
  	remove_column :subjects, :subject_id
  	remove_column :subject_modules, :subjectmodule_id
  	remove_column :sources, :source_id
  	remove_column :portfolios, :portfolio_id
  end

  def down
  end
end
