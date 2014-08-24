class AddDefaultValueToPrtdemo < ActiveRecord::Migration
  def change
    change_column :portfolios, :prtdemo, :boolean, :default_value => true
  end
end
