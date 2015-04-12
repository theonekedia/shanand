class AddTodayLowToDayTrading < ActiveRecord::Migration
  def change
    add_column :day_tradings, :today_low, :decimal, precision: 10, scale: 2 
  end
end
