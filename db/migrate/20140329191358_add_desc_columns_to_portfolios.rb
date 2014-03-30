class AddDescColumnsToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :prttitle, :string
    add_column :portfolios, :prtdesc, :string
    add_column :portfolios, :prtslug, :string
  end
end
