class AddF2WkLowToDayTrading < ActiveRecord::Migration
  def change
    add_column :day_tradings, :f2_week_low, :decimal, precision: 10, scale: 2 
    add_column :day_tradings, :f2_week_high, :decimal, precision: 10, scale: 2 
  end
end
