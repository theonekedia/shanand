# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#require 'nokogiri'
#require 'open-uri'

main_url='http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/index.html'
fil=File.open('/home/sradhu/BRM/Shareanand_rough/log_seeds.txt',"a")
v_book_value = nil
v_eps = nil
index_doc = Nokogiri::HTML(open(main_url))
# get the table of company names and links.
links_page=index_doc.xpath('//table[@class="tbldata14 bdrtpg"]/tr/td[1]/a')
links_page.each do |lnk| 
html='http://www.moneycontrol.com' + lnk["href"]

fil.puts html
#Opens the page of each company from above list.
doc = Nokogiri::HTML(open(html))

#meta_tbl values
prim_values = doc.xpath('//div[@class="FL gry10"]/text()')
mt_detl={}
prim_values.each do |val|
strng=val.to_s.split(":") #.strip.gsub(/&amp;/,'&')
# Generate Key - Value pair. Get the text only after striping.
mt_detl[strng[0].lstrip]=strng[1].lstrip.rstrip.strip.gsub(/&amp;/,'&')
end

#script_industry=mt_detl["SECTOR"]
script_industry=doc.xpath('//div[@class="FL gry10"]/a["href"]/text()').to_s.strip.gsub(/&amp;/,'&') #if mt_detl["SECTOR"].nil?
fil.puts script_industry

#Script_meta_data table 
 #   t.string   "isi_num"
 #   t.integer  "bse_script_numb"
 #   t.string   "nse_script_name"
 #   t.string   "money_control_script_name"  # Get the Display Name # change the field name.
 #   t.string   "financial_page_link"   # Probably Not required.
 #   t.string   "balance_sheet_link"	# Consolidated Balance Sheet link
 #   t.string   "p_l_link"			# Consolidated Profit and Loss link
 #   t.string   "money_control_link"	# Company Home Page Link
 #   t.decimal  "f2_week_low"
 #   t.decimal  "f2_week_high",              precision: 10, scale: 2
 #   t.decimal  "market_cap", 			# Number of Out standing shares * share Price # It is better to be in DayTrading.
 #   t.integer  "number_of_shares"		# From Profit and Loss table.  script_meta_datum.number_of_shares
 #   t.string   "industry"				# 
 #   t.datetime "created_at",                                         null: false
 #   t.datetime "updated_at",                                         null: false
 #   t.decimal  "graham_fvp",         = SQRT(22.5 * book_value * book_value)
 #   t.decimal  "eps",                      script_meta_datum.eps= profit_and_loss.eps_0
 #   t.decimal  "book_value",                script_meta_datum.book_value= balance_sheet.bk_val_0

if ScriptMetaDatum.find_by_nse_script_name(mt_detl["NSE"]).nil?

script_meta_datum = ScriptMetaDatum.new
script_meta_datum.isi_num=mt_detl["ISIN"]
script_meta_datum.bse_script_numb=mt_detl["BSE"]
script_meta_datum.nse_script_name=mt_detl["NSE"]	
script_meta_datum.industry=script_industry
script_meta_datum.company_display_name=mt_detl["NSE"]
#script_meta_datum.money_control_link=html.to_s

daytrading=DayTrading.new

daytrading.isi_num=mt_detl["ISIN"]
daytrading.nse_script_name=mt_detl["NSE"]	


fil.puts mt_detl
# to get the 52 week's low and high values.
range=doc.xpath('//div[@class="PT10 PR40"]/div[@class="PB3 gD_11"][2]/span')
script_meta_datum.f2_week_low=range.css('span.PR5').text
script_meta_datum.f2_week_high=range.css('span.PL5').text

# It will give you the Finacial Page links. It is from page's total links table.
fin_links=doc.xpath('//div[@class="PT35"]/table/tr/td[4]/ul/li/a')
b_s_link='http://www.moneycontrol.com' + fin_links.css('a')[0]['href']
p_l_link='http://www.moneycontrol.com' + fin_links.css('a')[1]['href']

p_l_doc=Nokogiri::HTML(open(p_l_link))
b_s_doc=Nokogiri::HTML(open(b_s_link))

begin
	consolidated_bs_link='http://www.moneycontrol.com' + b_s_doc.xpath('//div[@class="tabns MR15"]/ul/li[2]/a').css('a')[0]["href"]
	consolidated_pl_link='http://www.moneycontrol.com' + p_l_doc.xpath('//div[@class="tabns MR15"]/ul/li[2]/a').css('a')[0]["href"]
rescue
	consolidated_pl_link=p_l_link
	consolidated_bs_link=b_s_link
end


fil.puts consolidated_bs_link
fil.puts consolidated_pl_link

script_meta_datum.balance_sheet_link =  consolidated_bs_link #working to get the link only
script_meta_datum.p_l_link=consolidated_pl_link



#Storing cosolidated details into balance_sheet details. 

b_s_page = Nokogiri::HTML(open(consolidated_bs_link))

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
balance_sheet.tot_shr_cap_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_shr_cap_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Equity Share Capital"
balance_sheet.eq_shr_cap_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.eq_shr_cap_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Share Application Money"
balance_sheet.shr_appl_mny_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.shr_appl_mny_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Preference Share Capital"
balance_sheet.pre_shr_cap_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.pre_shr_cap_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Reserves"
balance_sheet.reserves_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.reserves_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.reserves_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.reserves_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.reserves_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Networth"
balance_sheet.networth_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.networth_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.networth_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.networth_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.networth_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Secured Loans"
balance_sheet.scrd_lons_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.scrd_lons_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Unsecured Loans"
balance_sheet.unscrd_lons_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.unscrd_lons_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Debt"
balance_sheet.tot_debt_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_debt_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Liabilities"
balance_sheet.tot_liabs_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_liabs_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Gross Block"
balance_sheet.gros_block_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.gros_block_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.gros_block_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.gros_block_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.gros_block_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Less: Revaluation Reserves"
balance_sheet.reval_rsrvs_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.reval_rsrvs_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Less: Accum. Depreciation"
balance_sheet.accm_deprec_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.accm_deprec_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Net Block"
balance_sheet.net_block_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.net_block_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.net_block_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.net_block_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.net_block_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Capital Work in Progress"
balance_sheet.cap_wip_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.cap_wip_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Investments"
balance_sheet.invstmnts_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.invstmnts_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Inventories"
balance_sheet.inventory_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.inventory_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.inventory_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.inventory_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.inventory_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Sundry Debtors"
balance_sheet.sndr_debts_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.sndr_debts_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Cash and Bank Balance"
balance_sheet.c_b_bal_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.c_b_bal_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Current Assets"
balance_sheet.tot_curr_assets_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_curr_assets_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Loans and Advances"
balance_sheet.loans_addv_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.loans_addv_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Fixed Deposits"
balance_sheet.fixd_deps_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.fixd_deps_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Total CA, Loans & Advances"
balance_sheet.tot_ca_loans_adv_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_ca_loans_adv_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Deferred Credit"
balance_sheet.defrd_cr_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.defrd_cr_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Current Liabilities"
balance_sheet.curr_liabs_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.curr_liabs_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f



when "Provisions"
balance_sheet.provisions_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.provisions_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.provisions_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.provisions_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.provisions_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Total CL & Provisions"
balance_sheet.tot_cl_provs_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_cl_provs_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Net Current Assets"
balance_sheet.net_curr_assets_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.net_curr_assets_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Miscellaneous Expenses"
balance_sheet.misc_expen_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.misc_expen_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Total Assets"
balance_sheet.tot_assets_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.tot_assets_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Contingent Liabilities"
balance_sheet.contignt_liabs_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.contignt_liabs_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Book Value (Rs)"
balance_sheet.bk_val_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
balance_sheet.bk_val_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
balance_sheet.bk_val_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
balance_sheet.bk_val_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
balance_sheet.bk_val_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

end


end
balance_sheet.save
fil.puts "bal_sheet is saved"

#Storing the Consolidated details of for Profit and loss 

p_l_page = Nokogiri::HTML(open(consolidated_pl_link))
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
profit_and_loss.sal_turnovr_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.sal_turnovr_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Excise Duty"
profit_and_loss.excs_duty_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.excs_duty_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Net Sales"
profit_and_loss.net_sales_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.net_sales_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Other Income"
profit_and_loss.other_income_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.other_income_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.other_income_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.other_income_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.other_income_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Stock Adjustments"
profit_and_loss.stck_adjst_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.stck_adjst_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Total Income"
profit_and_loss.tot_income_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tot_income_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Raw Materials"
profit_and_loss.raw_matrls_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.raw_matrls_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Power & Fuel Cost"
profit_and_loss.pwr_fuel_cst_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pwr_fuel_cst_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Employee Cost"
profit_and_loss.exmploy_cst_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.exmploy_cst_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Other Manufacturing Expenses"
profit_and_loss.othr_manufctr_exp_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.othr_manufctr_exp_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Selling and Admin Expenses"
profit_and_loss.selling_admin_exp_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.selling_admin_exp_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Miscellaneous Expenses"
profit_and_loss.misc_exp_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.misc_exp_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Preoperative Exp Capitalised"
profit_and_loss.preoperative_exp_cap_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.preoperative_exp_cap_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Total Expenses"
profit_and_loss.tot_exp_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tot_exp_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Operating Profit"
profit_and_loss.opertng_prft_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.opertng_prft_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "PBDIT"
profit_and_loss.pbdit_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pbdit_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Interest"
profit_and_loss.interest_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.interest_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.interest_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.interest_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.interest_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "PBDT"
profit_and_loss.pbdt_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pbdt_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Depreciation"
profit_and_loss.deprec_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.deprec_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.deprec_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.deprec_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.deprec_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Other Written Off"
profit_and_loss.othr_writn_off_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.othr_writn_off_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Profit Before Tax"
profit_and_loss.pbt_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pbt_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pbt_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pbt_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pbt_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Extra-ordinary items"
profit_and_loss.extr_ord_itms_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.extr_ord_itms_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "PBT (Post Extra-ord Items)"
profit_and_loss.post_pbt_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.post_pbt_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Tax"
profit_and_loss.tax_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tax_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tax_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tax_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tax_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Reported Net Profit"
profit_and_loss.repo_net_prft_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.repo_net_prft_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Total Value Addition"
profit_and_loss.tot_val_adtn_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.tot_val_adtn_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Preference Dividend"
profit_and_loss.pref_dvdnd_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.pref_dvdnd_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Equity Dividend"
profit_and_loss.equ_dvdnd_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.equ_dvdnd_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


when "Corporate Dividend Tax"
profit_and_loss.co_div_tax_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.co_div_tax_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Shares in issue (lakhs)"
profit_and_loss.no_shares_issued_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.no_shares_issued_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

#update number of shares in Script Meta Data table
script_meta_datum.number_of_shares=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
daytrading.tot_outstanding_shares=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f


when "Earning Per Share (Rs)"
profit_and_loss.eps_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.eps_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.eps_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.eps_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.eps_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

script_meta_datum.eps=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
daytrading.eps=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
v_eps=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f.abs

when "Equity Dividend (%)"
profit_and_loss.eqt_divdnd_perc_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.eqt_divdnd_perc_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

when "Book Value (Rs)"
profit_and_loss.bk_val_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
profit_and_loss.bk_val_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

# Update book Value 
script_meta_datum.book_value = rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
daytrading.book_value = rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
v_book_value = rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f.abs

end

end
profit_and_loss.save

fil.puts "profit-loss is saved"
script_meta_datum.graham_fvp= Math.sqrt(22.5 * v_book_value * v_eps)
script_meta_datum.save	

# One Time update
#    t.string   "isi_num",                                    null: false
#    t.string   "nse_script_name",                            null: false
#    t.decimal  "graham_fvp",        precision: 10, scale: 2  SQRT(22.5 * book_value * eps)
#    t.decimal  "eps",               precision: 10, scale: 2
#    t.decimal  "book_value",        precision: 10, scale: 2
#    t.integer  "tot_outstanding_shares"		# From Profit and Loss table.  script_meta_datum.number_of_shares

# Daily Update
#    t.decimal  "today_open",        precision: 10, scale: 2
#    t.decimal  "today_high",        precision: 10, scale: 2
#    t.decimal  "today_close",       precision: 10, scale: 2
#    t.decimal  "pre_day_close",     precision: 10, scale: 2
#    t.integer  "tot_shares_traded"
#    t.decimal  "perc_change",       precision: 5,  scale: 2
#    t.decimal  "pe_ratio"       precision: 5,  scale: 2   today_close/eps
#    t.decimal  "today_low",         precision: 10, scale: 2
#  	 t.decimal  "market_cap", 			# Number of Out standing shares * share Price # It is better to be in DayTrading.

daytrading.graham_fvp= Math.sqrt(22.5 * v_book_value * v_eps)

daytrading.save

else
next
end
end
