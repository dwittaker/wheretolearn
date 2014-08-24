class AddPortdemoToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :portdemo, :boolean
  end
end
