class CreateCategory3s < ActiveRecord::Migration
  def change
    create_table :category3s do |t|
      t.references :category2
      t.string :cat3cod
      t.string :cat3desc

      t.timestamps
    end
    add_index :category3s, :category2_id
  end
end
