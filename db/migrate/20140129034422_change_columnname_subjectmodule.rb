class ChangeColumnnameSubjectmodule < ActiveRecord::Migration
  def up
  	rename_column :subject_modules, :name , :smname
  	rename_column :subject_modules, :description , :smdescription
  	rename_column :subject_modules, :purpose , :smpurpose
  end

  def down
    rename_column :subject_modules , :smname, :name
  	rename_column :subject_modules , :smdescription, :description
  	rename_column :subject_modules , :smpurpose, :purpose

  end
end
