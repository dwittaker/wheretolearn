class AddSlugToSources < ActiveRecord::Migration
  def change
    add_column :sources, :slug, :string


    add_index :sources, :slug
  end
end
