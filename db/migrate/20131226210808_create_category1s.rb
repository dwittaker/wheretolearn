class CreateCategory1s < ActiveRecord::Migration
  def change
    create_table :category1s do |t|
      t.string :cat1cod
      t.string :cat1desc

      t.timestamps
    end
  end
end
