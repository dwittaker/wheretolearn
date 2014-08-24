class RenamePortdemoColumnPortfolios < ActiveRecord::Migration
  def up
    rename_column :portfolios, :portdemo, :prtdemo
  end

  def down
    rename_column :portfolios, :prtdemo, :portdemo
  end
end
