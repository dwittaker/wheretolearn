class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :portfolioid
      t.integer :subjectid
      t.integer :sourceid
      t.string :pweburl
      t.text :physaddress
      t.decimal :cost
      t.string :currency
      t.integer :costtype
      t.integer :schedtype
      t.integer :method
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps
    end
  end
end
