# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

main_url='http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/index.html'
fil=File.open('/home/sradhu/BRM/Shareanand_rough/log_seeds.txt',"a")

index_doc = Nokogiri::HTML(open(main_url))
links_page=index_doc.xpath('//table[@class="tbldata14 bdrtpg"]/tr/td[1]/a')
links_page.each do |lnk| 
html='http://www.moneycontrol.com' + lnk["href"]

fil.puts html

doc = Nokogiri::HTML(open(html))

#meta_tbl values
prim_values = doc.xpath('//div[@class="FL gry10"]/text()')
mt_detl={}
prim_values.each do |val|
strng=val.to_s.split(":")
mt_detl[strng[0].lstrip]=strng[1].lstrip
end

script_industry=mt_detl["SECTOR"]
script_industry=doc.xpath('//div[@class="FL gry10"]/a["href"]/text()').to_s if mt_detl["SECTOR"] == nil
fil.puts script_industry


script_meta_datum = ScriptMetaDatum.new
script_meta_datum.isi_num=mt_detl["ISIN"]
script_meta_datum.bse_script_numb=mt_detl["BSE"]
script_meta_datum.nse_script_name=mt_detl["NSE"]	
script_meta_datum.industry=script_industry
script_meta_datum.money_control_script_name=mt_detl["NSE"]
script_meta_datum.money_control_link=html.to_s

fil.puts mt_detl

range=doc.xpath('//div[@class="PT10 PR40"]/div[@class="PB3 gD_11"][2]/span')
script_meta_datum.f2_week_low=range.css('span.PR5').text
script_meta_datum.f2_week_high=range.css('span.PL5').text

fin_links=doc.xpath('//div[@class="PT35"]/table/tr/td[4]/ul/li/a')
b_s_link='http://www.moneycontrol.com' + fin_links.css('a')[0]['href']
p_l_link='http://www.moneycontrol.com' + fin_links.css('a')[1]['href']

fil.puts b_s_link
fil.puts p_l_link

script_meta_datum.balance_sheet_link =  b_s_link #working to get the link only
script_meta_datum.p_l_link=p_l_link
script_meta_datum.save	


#balance_sheet details

b_s_page = Nokogiri::HTML(open(b_s_link))

bal_sheet = b_s_page.xpath('//table[@class="table4"][3]/tr')

balance_sheet=BalanceSheet.new

balance_sheet.industry=script_industry
balance_sheet.isi_num=mt_detl["ISIN"]
balance_sheet.nse_script_name=mt_detl["NSE"]

bal_sheet.collect do |row|
begin
next if row.css('td')[0].text.empty? or row.css('td')[1].text.empty?
rescue

end

case row.css('td')[0].text.to_s
when "Total Share Capital"
balance_sheet.tot_shr_cap_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_4=row.css('td')[5].text.gsub(/,/,'').to_f
when "Equity Share Capital"
balance_sheet.eq_shr_cap_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_4=row.css('td')[5].text.gsub(/,/,'').to_f
when "Share Application Money"
balance_sheet.shr_appl_mny_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Preference Share Capital"
balance_sheet.pre_shr_cap_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Reserves"
balance_sheet.reserves_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.reserves_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.reserves_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.reserves_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.reserves_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Networth"
balance_sheet.networth_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.networth_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.networth_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.networth_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.networth_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Secured Loans"
balance_sheet.scrd_lons_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Unsecured Loans"
balance_sheet.unscrd_lons_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Debt"
balance_sheet.tot_debt_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Liabilities"
balance_sheet.tot_liabs_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Gross Block"
balance_sheet.gros_block_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.gros_block_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.gros_block_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.gros_block_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.gros_block_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Less: Revaluation Reserves"
balance_sheet.reval_rsrvs_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Less: Accum. Depreciation"
balance_sheet.accm_deprec_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Net Block"
balance_sheet.net_block_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.net_block_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.net_block_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.net_block_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.net_block_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Capital Work in Progress"
balance_sheet.cap_wip_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Investments"
balance_sheet.invstmnts_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Inventories"
balance_sheet.inventory_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.inventory_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.inventory_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.inventory_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.inventory_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Sundry Debtors"
balance_sheet.sndr_debts_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Cash and Bank Balance"
balance_sheet.c_b_bal_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Current Assets"
balance_sheet.tot_curr_assets_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Loans and Advances"
balance_sheet.loans_addv_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Fixed Deposits"
balance_sheet.fixd_deps_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Total CA, Loans & Advances"
balance_sheet.tot_ca_loans_adv_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_4=row.css('td')[5].text.gsub(/,/,'').to_f


when "Deferred Credit"
balance_sheet.defrd_cr_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_4=row.css('td')[5].text.gsub(/,/,'').to_f


when "Current Liabilities"
balance_sheet.curr_liabs_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_4=row.css('td')[5].text.gsub(/,/,'').to_f



when "Provisions"
balance_sheet.provisions_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.provisions_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.provisions_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.provisions_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.provisions_4=row.css('td')[5].text.gsub(/,/,'').to_f


when "Total CL & Provisions"
balance_sheet.tot_cl_provs_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_4=row.css('td')[5].text.gsub(/,/,'').to_f


when "Net Current Assets"
balance_sheet.net_curr_assets_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Miscellaneous Expenses"
balance_sheet.misc_expen_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_4=row.css('td')[5].text.gsub(/,/,'').to_f


when "Total Assets"
balance_sheet.tot_assets_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Contingent Liabilities"
balance_sheet.contignt_liabs_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_4=row.css('td')[5].text.gsub(/,/,'').to_f

when "Book Value (Rs)"
balance_sheet.bk_val_0=row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.bk_val_1=row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.bk_val_2=row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.bk_val_3=row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.bk_val_4=row.css('td')[5].text.gsub(/,/,'').to_f

end


end
balance_sheet.save
fil.puts "bal_sheet is saved"

p_l_page = Nokogiri::HTML(open(p_l_link))
profit_loss = p_l_page.xpath('//table[@class="table4"][3]/tr')

profit_and_loss = ProfitAndLoss.new

profit_and_loss.industry=script_industry
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

fil.puts "profit-loss is saved"
end
