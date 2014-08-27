class AddAuthorToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :author, :string
  end
end
