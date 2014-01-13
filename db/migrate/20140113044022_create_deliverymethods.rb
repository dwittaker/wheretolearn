class CreateDeliverymethods < ActiveRecord::Migration
  def change
    create_table :deliverymethods do |t|
      t.string :dmcod
      t.string :dmdesc
      t.string :dmimgurl
      t.string :dmimgtype
      t.integer :dmimgw
      t.integer :dmimgh

      t.timestamps
    end
  end
end
