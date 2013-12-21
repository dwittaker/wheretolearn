class SetRefsubjmodule < ActiveRecord::Migration
  def change
rename_column :subject_modules, :subjectid, :subject_id


  end

  def down
  end
end
