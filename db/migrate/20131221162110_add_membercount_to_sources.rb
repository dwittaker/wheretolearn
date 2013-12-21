class AddMembercountToSources < ActiveRecord::Migration
  def change
    add_column :sources, :membercount, :integer
  end
end
