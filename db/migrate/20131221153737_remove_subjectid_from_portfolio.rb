class RemoveSubjectidFromPortfolio < ActiveRecord::Migration
  def up
    remove_column :portfolios, :subjectid
  end

  def down
    add_column :portfolios, :subjectid, :integer
  end
end
