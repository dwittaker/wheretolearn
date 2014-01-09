class CreateCategory2s < ActiveRecord::Migration
  def change
    create_table :category2s do |t|
      t.references :category1
      t.string :cat2cod
      t.string :cat2desc

      t.timestamps
    end
    add_index :category2s, :category1_id
  end
end
