class AddModuleidToPortfolio_2 < ActiveRecord::Migration
  def change
    add_column :portfolio, :moduleid, :integer
  end
end
