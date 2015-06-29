class AddNseHistTblNametoScriptMetaDatum < ActiveRecord::Migration
  def change
  	rename_column :script_meta_data, :money_control_script_name, :company_display_name
  	rename_column :script_meta_data, :money_control_link, :company_home_page
	remove_column :script_meta_data, :market_cap
	add_column :script_meta_data,	:nse_hist_tbl_name, :string
	add_column :script_meta_data,	:bse_hist_tbl_name, :string
	
#, total outstanding shares
	add_column :day_tradings,	:market_cap,   :decimal, :precision => 10, :scale => 2
	add_column :day_tradings,	:tot_outstanding_shares, :integer
	add_column :day_tradings,	:pe_ratio, :decimal, :precision => 10, :scale => 2

  end
end
