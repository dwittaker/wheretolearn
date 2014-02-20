class CreateSchedtypes < ActiveRecord::Migration
  def change
    create_table :schedtypes do |t|
      t.string :schedname
      t.string :scheddesc

      t.timestamps
    end
  end
end
