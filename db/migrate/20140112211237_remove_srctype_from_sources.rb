class RemoveSrctypeFromSources < ActiveRecord::Migration
  def up
    remove_column :sources, :srctype
  end

  def down
    add_column :sources, :srctype, :integer
  end
end
