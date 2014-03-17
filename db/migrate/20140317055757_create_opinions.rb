class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|

      t.references :opinionable, :polymorphic => true

      t.decimal :rating
      t.string :comment
      t.references :user

      t.timestamps
    end
    add_index :opinions, :user_id
    add_index :opinions, :opinionable_id
  end
end
