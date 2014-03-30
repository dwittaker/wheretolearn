class AddTitleColumnToOpinions < ActiveRecord::Migration
  def change
    add_column :opinions, :optitle, :string
  end
end
