class AddModuleidToPortfolio_2 < ActiveRecord::Migration
  def change
    add_column :portfolios, :moduleid, :integer
  end
end
