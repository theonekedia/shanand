class AddGrossProfitMargin0ToRatiosAndAnalysis < ActiveRecord::Migration
  def change
	add_column :ratios_and_analyses,  :gross_profit_margin_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :gross_profit_margin_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :gross_profit_margin_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :gross_profit_margin_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :gross_profit_margin_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :oper_profit_margn_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :oper_profit_margn_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :oper_profit_margn_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :oper_profit_margn_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :oper_profit_margn_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :net_proft_margn_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :net_proft_margn_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :net_proft_margn_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :net_proft_margn_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :net_proft_margn_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :eps_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :eps_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :eps_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :eps_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :eps_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :interest_paid_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_paid_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_paid_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_paid_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_paid_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :interest_coverage_ratio_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_coverage_ratio_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_coverage_ratio_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_coverage_ratio_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :interest_coverage_ratio_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :return_on_asset_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_asset_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_asset_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_asset_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_asset_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :return_on_equity_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_equity_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_equity_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_equity_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :return_on_equity_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :debt_Ratio_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_Ratio_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_Ratio_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_Ratio_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_Ratio_4, :decimal, :precision => 10, :scale => 2 
	
	add_column :ratios_and_analyses,  :current_ratio_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :current_ratio_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :current_ratio_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :current_ratio_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :current_ratio_4, :decimal, :precision => 10, :scale => 2 	
	
	add_column :ratios_and_analyses,  :debt_equity_ratio_0, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_equity_ratio_1, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_equity_ratio_2, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_equity_ratio_3, :decimal, :precision => 10, :scale => 2 
	add_column :ratios_and_analyses,  :debt_equity_ratio_4, :decimal, :precision => 10, :scale => 2 
		
	add_index :ratios_and_analyses,  :nse_script_name
  end
end
