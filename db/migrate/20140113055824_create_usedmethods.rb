class CreateUsedmethods < ActiveRecord::Migration
  def change
    create_table :usedmethods do |t|
      t.references :deliverymethod
      t.references :deliverable, :polymorphic => true

      t.timestamps
    end
    add_index :usedmethods, :deliverymethod_id
    add_index :usedmethods, :deliverable_id
  end
end
