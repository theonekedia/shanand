class AddcolumnsToRatiosTable < ActiveRecord::Migration
  def change
  	  	rename_column :ratios_and_analyses, :interest_paid_0, :fixed_charge_coverage_ratio_0
  	  	rename_column :ratios_and_analyses, :interest_paid_1, :fixed_charge_coverage_ratio_1
  	  	rename_column :ratios_and_analyses, :interest_paid_2, :fixed_charge_coverage_ratio_2
  	  	rename_column :ratios_and_analyses, :interest_paid_3, :fixed_charge_coverage_ratio_3
  	  	rename_column :ratios_and_analyses, :interest_paid_4, :fixed_charge_coverage_ratio_4

 	  	add_column :ratios_and_analyses,	:return_on_capital_employed_0, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_capital_employed_1, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_capital_employed_2, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_capital_employed_3, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_capital_employed_4, :decimal, :precision => 10, :scale => 2

  	  	add_column :ratios_and_analyses,	:return_on_networth_0, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_networth_1, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_networth_2, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_networth_3, :decimal, :precision => 10, :scale => 2
  	  	add_column :ratios_and_analyses,	:return_on_networth_4, :decimal, :precision => 10, :scale => 2

  	  	
		add_column :ratios_and_analyses,	:assets_turnover_ratio_0, :decimal, :precision => 10, :scale => 2
		add_column :ratios_and_analyses,	:assets_turnover_ratio_1, :decimal, :precision => 10, :scale => 2
		add_column :ratios_and_analyses,	:assets_turnover_ratio_2, :decimal, :precision => 10, :scale => 2
		add_column :ratios_and_analyses,	:assets_turnover_ratio_3, :decimal, :precision => 10, :scale => 2
		add_column :ratios_and_analyses,	:assets_turnover_ratio_4, :decimal, :precision => 10, :scale => 2
  end
end
