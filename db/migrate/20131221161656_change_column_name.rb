class ChangeColumnName < ActiveRecord::Migration
  def up
  	rename_column :portfolios, :membercount, :learnercount
  end

  def down
  end
end
