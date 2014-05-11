class AddModuleidToPortfolio1 < ActiveRecord::Migration
  def change
    add_column :portfolios, :moduleid, :integer
  end
end
