class AddDefaultValueToPrttiercost < ActiveRecord::Migration
  def change
    change_column :portfolios, :prttiercost, :boolean, :default_value => false
  end
end
