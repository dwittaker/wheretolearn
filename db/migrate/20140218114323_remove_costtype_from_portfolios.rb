class RemoveCosttypeFromPortfolios < ActiveRecord::Migration
  def up
    remove_column :portfolios, :costtype
  end

  def down
    add_column :portfolios, :costtype, :integer
  end
end
