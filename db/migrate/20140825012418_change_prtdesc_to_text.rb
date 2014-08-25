class ChangePrtdescToText < ActiveRecord::Migration
  def up
    change_column :portfolios, :prtdesc, :text
  end

  def down
    change_column :portfolios, :prtdesc, :string
  end
end
