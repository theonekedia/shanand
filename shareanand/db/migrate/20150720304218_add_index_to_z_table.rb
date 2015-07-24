class AddIndexToZTable < ActiveRecord::Migration
  def change
  	add_index "z_tables", "z_value" , name: "z_tables_on_z_value", unique: true 
    add_index "risk_and_returns", "nse_script_name" , name: "risk_and_returns_on_nse_script_name", unique: true 
  end
end
