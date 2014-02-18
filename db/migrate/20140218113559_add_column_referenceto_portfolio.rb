class AddColumnReferencetoPortfolio < ActiveRecord::Migration
  def up

    add_column :portfolios, :costtype_id, :integer,  references: :costtype

  end

  def down

    remove_column :portfolios, :costtype_id, :integer,  references: :costtype
  end
end
