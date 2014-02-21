class RemoveMethodColumnFromPortfolios < ActiveRecord::Migration
  def up

    remove_column :portfolios, :method
  end

  def down
    add_column :portfolios, :method, :integer

  end
end
