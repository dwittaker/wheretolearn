class CreateContenttags < ActiveRecord::Migration
  def change
    create_table :contenttags do |t|
      t.string :ctagdesc
      t.references :taggable, :polymorphic => true

      t.timestamps
    end
    add_index :contenttags, :taggable_id
  end
end
