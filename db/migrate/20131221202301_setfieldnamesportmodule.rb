class Setfieldnamesportmodule < ActiveRecord::Migration
  def up
  	rename_column :portfolios, :portfolioid, :portfolio_id
  	rename_column :portfolios, :subjectmoduleid, :subjectmodule_id
  	rename_column :subject_modules, :subjectmoduleid, :subjectmodule_id
  end

  def down
  end
end
