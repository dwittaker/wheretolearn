class Renamesubjectsindex < ActiveRecord::Migration
  def up
  	rename_column :subjects, :subjectid, :subject_id
  end

  def down
  end
end
