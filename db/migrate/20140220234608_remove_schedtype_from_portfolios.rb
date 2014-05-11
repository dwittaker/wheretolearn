class RemoveSchedtypeFromPortfolios < ActiveRecord::Migration
  def up
    remove_column :portfolios, :schedtype
  end

  def down
    add_column :portfolios, :schedtype, :integer
  end
end
