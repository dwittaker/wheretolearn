class RemoveModuleidFromPortfolio < ActiveRecord::Migration
  def up
    remove_column :portfolios, :moduleid
  end

  def down
    add_column :portfolios, :moduleid, :integer
  end
end
