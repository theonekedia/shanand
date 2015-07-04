

index_array=ScriptMetaDatum.uniq.pluck(:nse_script_name)
fil=File.open('/home/sradhu/BRM/Shareanand_rough/log_seeds.txt',"a")

index_array.each do |script_name|

bal_sheet = BalanceSheet.find_by_nse_script_name(script_name)
prft_loss = ProfitAndLoss.find_by_nse_script_name(script_name)

fil.puts script_name

ratio_analysis=RatiosAndAnalysis.new

#ScriptMetaDatum.find_each do |record|

#skip banking sector
next if bal_sheet.networth_0.nil?

ratio_analysis.industry= bal_sheet.industry
ratio_analysis.isi_num = bal_sheet.isi_num
ratio_analysis.nse_script_name = bal_sheet.nse_script_name

ratio_analysis.oper_profit_margn_0= prft_loss.opertng_prft_0 * 100 / prft_loss.net_sales_0
ratio_analysis.gross_profit_margin_0 = (prft_loss.net_sales_0 - prft_loss.tot_exp_0 ) * 100 / prft_loss.net_sales_0
ratio_analysis.net_proft_margn_0 = prft_loss.repo_net_prft_0 * 100 / prft_loss.net_sales_0
ratio_analysis.eps_0 = prft_loss.eps_0
ratio_analysis.interest_coverage_ratio_0 = (prft_loss.interest_0.nil? || prft_loss.interest_0 ==0 ) ? nil : prft_loss.pbdit_0 / prft_loss.interest_0
ratio_analysis.return_on_asset_0 = (prft_loss.pbdit_0 - prft_loss.deprec_0) * 100 / bal_sheet.tot_assets_0
ratio_analysis.debt_Ratio_0 = bal_sheet.tot_liabs_0 / bal_sheet.tot_assets_0
ratio_analysis.current_ratio_0= bal_sheet.tot_curr_assets_0 / bal_sheet.curr_liabs_0
ratio_analysis.debt_equity_ratio_0 = bal_sheet.tot_debt_0 / bal_sheet.networth_0
ratio_analysis.assets_turnover_ratio_0 = prft_loss.net_sales_0 / bal_sheet.tot_assets_0
ratio_analysis.return_on_equity_0 = prft_loss.repo_net_prft_0 * 100 / (bal_sheet.tot_shr_cap_0 + prft_loss.pref_dvdnd_0 + bal_sheet.reserves_0)
ratio_analysis.return_on_capital_employed_0= (prft_loss.pbdit_0 - prft_loss.deprec_0) * 100 / bal_sheet.tot_liabs_0
ratio_analysis.return_on_networth_0 = prft_loss.repo_net_prft_0 * 100 / bal_sheet.networth_0
ratio_analysis.fixed_charge_coverage_ratio_0 = (prft_loss.interest_0.nil? || prft_loss.interest_0 ==0 ) ? nil : ( prft_loss.pbdit_0 / prft_loss.interest_0 )


if prft_loss.net_sales_1.nil?
	next
else
ratio_analysis.oper_profit_margn_1= prft_loss.opertng_prft_1 * 100 / prft_loss.net_sales_1
ratio_analysis.gross_profit_margin_1 = (prft_loss.net_sales_1 - prft_loss.tot_exp_1 ) * 100 / prft_loss.net_sales_1
ratio_analysis.net_proft_margn_1 = prft_loss.repo_net_prft_1 * 100 / prft_loss.net_sales_1
ratio_analysis.eps_1 = prft_loss.eps_1
ratio_analysis.interest_coverage_ratio_1 = (prft_loss.interest_1.nil? || prft_loss.interest_1 ==0 ) ? nil : prft_loss.pbdit_1 / prft_loss.interest_1
ratio_analysis.return_on_asset_1 = (prft_loss.pbdit_1 - prft_loss.deprec_1) * 100 / bal_sheet.tot_assets_1
ratio_analysis.debt_Ratio_1 = bal_sheet.tot_liabs_1 / bal_sheet.tot_assets_1
ratio_analysis.current_ratio_1= bal_sheet.tot_curr_assets_1 / bal_sheet.curr_liabs_1
ratio_analysis.debt_equity_ratio_1 = bal_sheet.tot_debt_1 / bal_sheet.networth_1
ratio_analysis.return_on_equity_1 = prft_loss.repo_net_prft_1 * 100 / (bal_sheet.tot_shr_cap_1 + prft_loss.pref_dvdnd_1 + bal_sheet.reserves_1)
ratio_analysis.assets_turnover_ratio_1 = prft_loss.net_sales_1 / bal_sheet.tot_assets_1
ratio_analysis.return_on_capital_employed_1= (prft_loss.pbdit_1 - prft_loss.deprec_1) * 100 / bal_sheet.tot_liabs_1
ratio_analysis.return_on_networth_1 = prft_loss.repo_net_prft_1 * 100 / bal_sheet.networth_1
ratio_analysis.fixed_charge_coverage_ratio_1 = (prft_loss.interest_1.nil? || prft_loss.interest_1 ==0 ) ? nil : ( prft_loss.pbdit_1 / prft_loss.interest_1 )
end



if prft_loss.net_sales_2.nil?
	next
else
ratio_analysis.oper_profit_margn_2= prft_loss.opertng_prft_2 * 100 / prft_loss.net_sales_2
ratio_analysis.gross_profit_margin_2 = (prft_loss.net_sales_2 - prft_loss.tot_exp_2 ) * 100 / prft_loss.net_sales_2
ratio_analysis.net_proft_margn_2 = prft_loss.repo_net_prft_2 * 100 / prft_loss.net_sales_2
ratio_analysis.eps_2 = prft_loss.eps_2
ratio_analysis.interest_coverage_ratio_2 = (prft_loss.interest_2.nil? || prft_loss.interest_2 ==0 ) ? nil : prft_loss.pbdit_2 / prft_loss.interest_2
ratio_analysis.return_on_asset_2 = (prft_loss.pbdit_2 - prft_loss.deprec_2) * 100 / bal_sheet.tot_assets_2
ratio_analysis.debt_Ratio_2 = bal_sheet.tot_liabs_2 / bal_sheet.tot_assets_2
ratio_analysis.current_ratio_2= bal_sheet.tot_curr_assets_2 / bal_sheet.curr_liabs_2
ratio_analysis.debt_equity_ratio_2 = bal_sheet.tot_debt_2 / bal_sheet.networth_2
ratio_analysis.return_on_equity_2 = prft_loss.repo_net_prft_2 * 100 / (bal_sheet.tot_shr_cap_2 + prft_loss.pref_dvdnd_2 + bal_sheet.reserves_2)
ratio_analysis.assets_turnover_ratio_2 = prft_loss.net_sales_2 / bal_sheet.tot_assets_2
ratio_analysis.return_on_capital_employed_2= (prft_loss.pbdit_2 - prft_loss.deprec_2) * 100 / bal_sheet.tot_liabs_2
ratio_analysis.return_on_networth_2 = prft_loss.repo_net_prft_2 * 100 / bal_sheet.networth_2
ratio_analysis.fixed_charge_coverage_ratio_2 = (prft_loss.interest_2.nil? || prft_loss.interest_2 ==0 ) ? nil : ( prft_loss.pbdit_2 / prft_loss.interest_2 )
end

if prft_loss.net_sales_3.nil?
	next
else
ratio_analysis.oper_profit_margn_3= prft_loss.opertng_prft_3 * 100 / prft_loss.net_sales_3
ratio_analysis.gross_profit_margin_3 = (prft_loss.net_sales_3 - prft_loss.tot_exp_3 ) * 100 / prft_loss.net_sales_3
ratio_analysis.net_proft_margn_3 = prft_loss.repo_net_prft_3 * 100 / prft_loss.net_sales_3
ratio_analysis.eps_3 = prft_loss.eps_3
ratio_analysis.interest_coverage_ratio_3 = (prft_loss.interest_3.nil? || prft_loss.interest_3 ==0 ) ? nil : prft_loss.pbdit_3 / prft_loss.interest_3
ratio_analysis.return_on_asset_3 = (prft_loss.pbdit_3 - prft_loss.deprec_3) * 100 / bal_sheet.tot_assets_3
ratio_analysis.debt_equity_ratio_3 = bal_sheet.tot_debt_3 / bal_sheet.networth_3
ratio_analysis.current_ratio_3= bal_sheet.tot_curr_assets_3 / bal_sheet.curr_liabs_3
ratio_analysis.debt_Ratio_3 = bal_sheet.tot_liabs_3 / bal_sheet.tot_assets_3
ratio_analysis.return_on_equity_3 = prft_loss.repo_net_prft_3 * 100 / (bal_sheet.tot_shr_cap_3 + prft_loss.pref_dvdnd_3 + bal_sheet.reserves_3)
ratio_analysis.return_on_capital_employed_3= (prft_loss.pbdit_3 - prft_loss.deprec_3) * 100 / bal_sheet.tot_liabs_3
ratio_analysis.assets_turnover_ratio_3 = prft_loss.net_sales_3 / bal_sheet.tot_assets_3
ratio_analysis.fixed_charge_coverage_ratio_3 = (prft_loss.interest_3.nil? || prft_loss.interest_3 ==0 ) ? nil : ( prft_loss.pbdit_3 / prft_loss.interest_3 )
ratio_analysis.return_on_networth_3 = prft_loss.repo_net_prft_3 * 100 / bal_sheet.networth_3
end

if prft_loss.net_sales_4.nil?
	next
else
ratio_analysis.oper_profit_margn_4= prft_loss.opertng_prft_4 * 100 / prft_loss.net_sales_4
ratio_analysis.gross_profit_margin_4 = (prft_loss.net_sales_4 - prft_loss.tot_exp_4 ) * 100 / prft_loss.net_sales_4
ratio_analysis.net_proft_margn_4 = prft_loss.repo_net_prft_4 * 100 / prft_loss.net_sales_4
ratio_analysis.eps_4 = prft_loss.eps_4
ratio_analysis.interest_coverage_ratio_4 = (prft_loss.interest_4.nil? || prft_loss.interest_4 ==0 ) ? nil : prft_loss.pbdit_4 / prft_loss.interest_4
ratio_analysis.return_on_asset_4 = (prft_loss.pbdit_4 - prft_loss.deprec_4) * 100 / bal_sheet.tot_assets_4
ratio_analysis.debt_Ratio_4 = bal_sheet.tot_liabs_4 / bal_sheet.tot_assets_4
ratio_analysis.current_ratio_4= bal_sheet.tot_curr_assets_4 / bal_sheet.curr_liabs_4
ratio_analysis.debt_equity_ratio_4 = bal_sheet.tot_debt_4 / bal_sheet.networth_4
ratio_analysis.return_on_equity_4 = prft_loss.repo_net_prft_4 * 100 / (bal_sheet.tot_shr_cap_4 + prft_loss.pref_dvdnd_4 + bal_sheet.reserves_4)
ratio_analysis.return_on_capital_employed_4= (prft_loss.pbdit_4 - prft_loss.deprec_4) * 100 / bal_sheet.tot_liabs_4
ratio_analysis.return_on_networth_4 = prft_loss.repo_net_prft_4 * 100 / bal_sheet.networth_4
ratio_analysis.fixed_charge_coverage_ratio_4 = (prft_loss.interest_4.nil? || prft_loss.interest_4 ==0 ) ? nil : ( prft_loss.pbdit_4 / prft_loss.interest_4 )
ratio_analysis.assets_turnover_ratio_4 = prft_loss.net_sales_4 / bal_sheet.tot_assets_4
end

ratio_analysis.save

end
