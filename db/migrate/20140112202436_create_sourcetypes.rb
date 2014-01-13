class CreateSourcetypes < ActiveRecord::Migration
  def change
    create_table :sourcetypes do |t|
      t.string :stcod
      t.text :stdesc

      t.timestamps
    end
  end
end
