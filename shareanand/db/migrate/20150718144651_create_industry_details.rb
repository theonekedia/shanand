class CreateIndustryDetails < ActiveRecord::Migration
  def change
    create_table :industry_details do |t|
		t.string   "industry"
		t.text 	   "info"
		t.string   "bse_index"
		t.decimal  "avg_pe",               precision: 10, scale: 2
		t.decimal  "avg_eps",                    precision: 10, scale: 2
	#profitability Ratios	
		t.decimal  "avg_gross_profit_margin",         precision: 10, scale: 2
		t.decimal  "avg_oper_profit_margn",           precision: 10, scale: 2
		t.decimal  "avg_net_proft_margn",             precision: 10, scale: 2
	#liquidity ratios
		t.decimal  "avg_current_ratio",               precision: 10, scale: 2
		t.decimal  "avg_turnover_ratio",     		  precision: 10, scale: 2
		t.decimal  "avg_assets_turnover_ratio",       precision: 10, scale: 2
	#coverage Ratios	
		t.decimal  "avg_fixed_charge_coverage_ratio", precision: 10, scale: 2
		t.decimal  "avg_interest_coverage_ratio",     precision: 10, scale: 2
		t.decimal  "avg_dividend_coverage_ratio",     precision: 10, scale: 2 #net profit after taxes / referred diviidend 
		
	#levarage/capital structure ratio	
		t.decimal  "avg_debt_equity_ratio",           precision: 10, scale: 2
		t.decimal  "avg_debt_assets_ratio",           precision: 10, scale: 2 # total debt / total assets
	# profitability ratios related to investments	
		t.decimal  "avg_return_on_asset",             precision: 10, scale: 2
		t.decimal  "avg_return_on_capital_employed",  precision: 10, scale: 2
		t.decimal  "avg_return_on_networth",          precision: 10, scale: 2
		t.decimal  "avg_return_on_equity",            precision: 10, scale: 2


		t.decimal  "avg_debt_Ratio",                  precision: 10, scale: 2

      	t.timestamps null: false
    end
   add_index "industry_details", "industry" , name: "index_industry_details_on_industry", unique: true 
 end
end
