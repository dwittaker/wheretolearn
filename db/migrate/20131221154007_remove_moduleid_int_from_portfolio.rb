class RemoveModuleidIntFromPortfolio < ActiveRecord::Migration
  def up
    remove_column :portfolios, :moduleid
  end

  def down
    add_column :portfolios, :moduleid, :Int
  end
end
