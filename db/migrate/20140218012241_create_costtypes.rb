class CreateCosttypes < ActiveRecord::Migration
  def change
    create_table :costtypes do |t|
      t.string :costname
      t.string :costdesc

      t.timestamps
    end
  end
end
