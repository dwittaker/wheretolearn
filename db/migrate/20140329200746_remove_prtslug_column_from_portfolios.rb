class RemovePrtslugColumnFromPortfolios < ActiveRecord::Migration
  def up
    remove_column :portfolios, :prtslug
  end

  def down
    add_column :portfolios, :prtslug, :string
  end
end
