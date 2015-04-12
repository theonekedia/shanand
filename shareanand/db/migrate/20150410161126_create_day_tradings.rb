class CreateDayTradings < ActiveRecord::Migration
  def change
    create_table :day_tradings do |t|
		t.string	:isi_num,	null: false 
		t.string	:nse_script_name, null: false 
		t.decimal	:today_open,	  precision: 10, scale: 2
		t.decimal	:today_high,	  precision: 10, scale: 2
		t.decimal	:today_close,	  precision: 10, scale: 2
		t.decimal	:pre_day_close,	  precision: 10, scale: 2
		t.integer	:tot_shares_traded 	
		t.decimal	:perc_change,	  precision: 5, scale: 2
		t.timestamps null: false
		
    end
    add_index :day_tradings, :nse_script_name
  end
end
