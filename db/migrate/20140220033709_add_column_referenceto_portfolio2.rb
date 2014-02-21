class AddColumnReferencetoPortfolio2 < ActiveRecord::Migration
  def up

    add_column :portfolios, :schedtype_id, :integer,  references: :schedtype

  end

  def down

    remove_column :portfolios, :schedtype_id, :integer,  references: :schedtype
  end
end
