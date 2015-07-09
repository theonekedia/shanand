require 'nokogiri'
require 'open-uri'

p_l_link='/home/sradhu/BRM/Shareanand_rough/RCOM_Prof_loss.html'
p_l_page = Nokogiri::HTML(open(p_l_link))

prim_values = p_l_page.xpath('//div[@class="FL gry10"]/text()')
mt_detl={}
prim_values.each do |val|
strng=val.to_s.split(":")
mt_detl[strng[0]]=strng[1].lstrip
end

profit_loss = p_l_page.xpath('//table[@class="table4"][3]/tbody/tr')

profit_and_loss = ProfitAndLoss.new

profit_and_loss.industry=mt_detl["SECTOR"]
profit_and_loss.isi_num=mt_detl["ISIN"]
profit_and_loss.nse_script_name=mt_detl["NSE"]


profit_loss.collect do |rec|
begin
next if rec.css('td')[0].text.empty? or rec.css('td')[1].text.empty?
rescue

end

case rec.css('td')[0].text.to_s
when "Sales Turnover"
profit_and_loss.sal_turnovr_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Excise Duty"
profit_and_loss.excs_duty_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Net Sales"
profit_and_loss.net_sales_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Other Income"
profit_and_loss.other_income_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.other_income_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.other_income_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.other_income_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.other_income_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Stock Adjustments"
profit_and_loss.stck_adjst_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Total Income"
profit_and_loss.tot_income_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Raw Materials"
profit_and_loss.raw_matrls_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Power & Fuel Cost"
profit_and_loss.pwr_fuel_cst_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Employee Cost"
profit_and_loss.exmploy_cst_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Other Manufacturing Expenses"
profit_and_loss.othr_manufctr_exp_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Selling and Admin Expenses"
profit_and_loss.selling_admin_exp_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Miscellaneous Expenses"
profit_and_loss.misc_exp_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Preoperative Exp Capitalised"
profit_and_loss.preoperative_exp_cap_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Total Expenses"
profit_and_loss.tot_exp_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Operating Profit"
profit_and_loss.opertng_prft_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "PBDIT"
profit_and_loss.pbdit_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Interest"
profit_and_loss.interest_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.interest_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.interest_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.interest_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.interest_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "PBDT"
profit_and_loss.pbdt_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Depreciation"
profit_and_loss.deprec_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.deprec_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.deprec_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.deprec_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.deprec_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Other Written Off"
profit_and_loss.othr_writn_off_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Profit Before Tax"
profit_and_loss.pbt_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pbt_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pbt_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pbt_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pbt_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Extra-ordinary items"
profit_and_loss.extr_ord_itms_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "PBT (Post Extra-ord Items)"
profit_and_loss.post_pbt_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Tax"
profit_and_loss.tax_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tax_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tax_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tax_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tax_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Reported Net Profit"
profit_and_loss.repo_net_prft_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Total Value Addition"
profit_and_loss.tot_val_adtn_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Preference Dividend"
profit_and_loss.pref_dvdnd_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Equity Dividend"
profit_and_loss.equ_dvdnd_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_4=rec.css('td')[5].text.gsub(/,/,'').to_f


when "Corporate Dividend Tax"
profit_and_loss.co_div_tax_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Shares in issue (lakhs)"
profit_and_loss.no_shares_issued_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Earning Per Share (Rs)"
profit_and_loss.eps_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.eps_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.eps_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.eps_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.eps_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Equity Dividend (%)"
profit_and_loss.eqt_divdnd_perc_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_4=rec.css('td')[5].text.gsub(/,/,'').to_f

when "Book Value (Rs)"
profit_and_loss.bk_val_0=rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_1=rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_2=rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_3=rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_4=rec.css('td')[5].text.gsub(/,/,'').to_f
end

end
profit_and_loss.save
