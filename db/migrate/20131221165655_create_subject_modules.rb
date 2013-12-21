class CreateSubjectModules < ActiveRecord::Migration
  def change
    create_table :subject_modules do |t|
      t.integer :subjectmoduleid
      t.integer :moduleid
      t.integer :subjectid
      t.string :name
      t.text :description
      t.text :purpose
      t.integer :category4
      t.integer :category5
      t.integer :order

      t.timestamps
    end
  end
end
