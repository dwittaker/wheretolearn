class AddMembercountToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :membercount, :integer
  end
end
