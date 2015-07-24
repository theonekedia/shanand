class CreateZTables < ActiveRecord::Migration
  def change
    create_table :z_tables do |t|
    	t.decimal  "z_value",      precision: 4, scale: 2	
		t.decimal  "area",      precision: 6, scale: 5	
    end
    add_index "z_tables", "z_value" , name: "z_tables_on_z_value", unique: true 
  end
end
