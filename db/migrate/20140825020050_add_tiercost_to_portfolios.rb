class AddTiercostToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :prttiercost, :boolean
    rename_column :portfolios, :prtdemo, :prttrial
  end
end
