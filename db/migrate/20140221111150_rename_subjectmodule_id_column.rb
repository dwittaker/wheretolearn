class RenameSubjectmoduleIdColumn < ActiveRecord::Migration
  def up
    rename_column :portfolios, :subjectmodule_id, :subject_module_id
  end

  def down
    rename_column :portfolios, :subject_module_id, :subjectmodule_id
  end
end
