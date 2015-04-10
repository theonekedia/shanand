class CreateScriptMetaData < ActiveRecord::Migration
  def change
    create_table :script_meta_data do |t|
		t.string	:isi_num,	null: false 
		t.integer	:bse_script_numb ,	null: false 
		t.string	:nse_script_name, null: false 
		t.string	:money_control_script_name, null: false 
		t.string	:financial_page_link
		t.string	:balance_sheet_link
		t.string	:p_l_link
		t.string	:money_control_link
		t.decimal   :f2_week_low,       precision: 10, scale: 2
		t.decimal   :f2_week_high,      precision: 10, scale: 2
		t.decimal   :market_cap,               precision: 10, scale: 2
		t.integer	:number_of_shares
		t.string	:industry
		t.timestamps null: false
    end
    add_index :script_meta_data, :isi_num, unique: true
    add_index :script_meta_data, :bse_script_numb
    add_index :script_meta_data, :nse_script_name
    add_index :script_meta_data, :money_control_script_name
  end
end
