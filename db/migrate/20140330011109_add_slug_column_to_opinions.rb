class AddSlugColumnToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :slug, :string
  end
end
