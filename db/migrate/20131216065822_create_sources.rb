class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.text :description
      t.string :weburl
      t.text :physaddress
      t.integer :srctype

      t.timestamps
    end
  end
end
