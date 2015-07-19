
array_url=["http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/banks-private-sector.html",
"http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/finance-general.html",
"http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/finance-housing.html",
"http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/finance-investments.html",
"http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/finance-leasing-hire-purchase.html",
"http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/finance-term-lending-institutions.html"]


fil=File.open('/home/sradhu/BRM/Shareanand_rough/log_seeds.txt',"a")
array_url.each do |main_url|
index_doc = Nokogiri::HTML(open(main_url))
links_page=index_doc.xpath('//table[@class="tbldata14 bdrtpg"]/tr/td[1]/a')
links_page.each do |lnk| 
fil.puts lnk
html='http://www.moneycontrol.com' + lnk["href"]
doc = Nokogiri::HTML(open(html))

script_industry=doc.xpath('//div[@class="FL gry10"]/a["href"]/text()').to_s.strip.gsub(/&amp;/,'&')
prim_values = doc.xpath('//div[@class="FL gry10"]/text()')
mt_detl={}
prim_values.each do |val|
strng=val.to_s.split(":") #.strip.gsub(/&amp;/,'&')
# Generate Key - Value pair. Get the text only after striping.
mt_detl[strng[0].lstrip]=strng[1].lstrip.rstrip.strip.gsub(/&amp;/,'&')
end

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
fil.puts script_industry
fil.puts mt_detl

b_s_page = Nokogiri::HTML(open(consolidated_bs_link))

bal_sheet = b_s_page.xpath('//table[@class="table4"][3]/tr')

if BankBalanceSheet.find_by_nse_script_name(mt_detl["NSE"]).nil?

balance_sheet=BankBalanceSheet.new

balance_sheet.industry = script_industry
balance_sheet.isi_num = mt_detl["ISIN"]
balance_sheet.nse_script_name = mt_detl["NSE"]

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

when "Init. Contribution Settler"
	balance_sheet.init_cntrb_stlr_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.init_cntrb_stlr_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.init_cntrb_stlr_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.init_cntrb_stlr_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.init_cntrb_stlr_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Preference Share Application Money"
	balance_sheet.pref_shr_appln_mny_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.pref_shr_appln_mny_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.pref_shr_appln_mny_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.pref_shr_appln_mny_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.pref_shr_appln_mny_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Employee Stock Opiton"	
	balance_sheet.emply_stck_optn_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.emply_stck_optn_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.emply_stck_optn_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.emply_stck_optn_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.emply_stck_optn_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Reserves"
	balance_sheet.reserves_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.reserves_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.reserves_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.reserves_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.reserves_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Net Worth"
	balance_sheet.networth_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.networth_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.networth_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.networth_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.networth_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Deposits"
	balance_sheet.deposits_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.deposits_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.deposits_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.deposits_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.deposits_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Borrowings"
	balance_sheet.borrowings_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.borrowings_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.borrowings_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.borrowings_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.borrowings_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Total Debt"
	balance_sheet.tot_debt_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.tot_debt_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.tot_debt_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.tot_debt_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.tot_debt_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Minority Interest"
	balance_sheet.minort_interest_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Policy Holders Funds"
	balance_sheet.polc_hldrs_fnds_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f	
	balance_sheet.polc_hldrs_fnds_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.polc_hldrs_fnds_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.polc_hldrs_fnds_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.polc_hldrs_fnds_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Group Share in Joint Venture"
	balance_sheet.grp_shr_jnt_vntr_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.grp_shr_jnt_vntr_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.grp_shr_jnt_vntr_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.grp_shr_jnt_vntr_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.grp_shr_jnt_vntr_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Other Liabilities &amp; Provisions"
	balance_sheet.othr_liabs_provsns_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.othr_liabs_provsns_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.othr_liabs_provsns_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.othr_liabs_provsns_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.othr_liabs_provsns_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Total Liabilities"
	balance_sheet.tot_liabs_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.tot_liabs_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.tot_liabs_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.tot_liabs_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.tot_liabs_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Cash &amp; Balances with RBI"
	balance_sheet.cash_bal_rbi_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.cash_bal_rbi_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.cash_bal_rbi_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.cash_bal_rbi_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.cash_bal_rbi_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Balance with Banks, Money at Call"
	balance_sheet.bal_bank_mny_cal_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.bal_bank_mny_cal_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.bal_bank_mny_cal_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.bal_bank_mny_cal_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.bal_bank_mny_cal_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Advances"
	balance_sheet.advances_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.advances_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.advances_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.advances_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.advances_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Investments"
	balance_sheet.invstmnts_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.invstmnts_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.invstmnts_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.invstmnts_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.invstmnts_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f
when "Gross Block"
	balance_sheet.gros_block_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.gros_block_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.gros_block_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.gros_block_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.gros_block_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Revaluation Reserves"
	balance_sheet.reval_reserves_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.reval_reserves_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.reval_reserves_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.reval_reserves_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.reval_reserves_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Accumulated Depreciation"
	balance_sheet.accum_deprectn_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.accum_deprectn_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.accum_deprectn_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.accum_deprectn_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.accum_deprectn_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Net Block"	
	balance_sheet.net_block_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.net_block_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.net_block_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.net_block_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.net_block_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Capital Work In Progress"	
	balance_sheet.cap_wip_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.cap_wip_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.cap_wip_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.cap_wip_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.cap_wip_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Other Assets"	
	balance_sheet.other_assets_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.other_assets_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.other_assets_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.other_assets_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.other_assets_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Minority Interest"	# has in liabilities and assets
	balance_sheet.minort_interest_assets_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_assets_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_assets_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_assets_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
	balance_sheet.minort_interest_assets_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Group Share in Joint Venture" # has in liabilities and assets
	balance_sheet.grp_shr_jnt_vntr_assets_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f	
	balance_sheet.grp_shr_jnt_vntr_assets_1=row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f	
	balance_sheet.grp_shr_jnt_vntr_assets_2=row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f	
	balance_sheet.grp_shr_jnt_vntr_assets_3=row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f	
	balance_sheet.grp_shr_jnt_vntr_assets_4=row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f	

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

when "Bills for collection"	
	balance_sheet.bills_fr_collect_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.bills_fr_collect_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f	
	balance_sheet.bills_fr_collect_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.bills_fr_collect_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
	balance_sheet.bills_fr_collect_0=row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f

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
end

if BankProfitLoss.find_by_nse_script_name(mt_detl["NSE"]).nil?

p_l_page = Nokogiri::HTML(open(consolidated_pl_link))
profit_loss = p_l_page.xpath('//table[@class="table4"][3]/tr')

profit_and_loss = BankProfitLoss.new

profit_and_loss.industry=script_industry
profit_and_loss.isi_num=mt_detl["ISIN"]
profit_and_loss.nse_script_name=mt_detl["NSE"]


profit_loss.collect do |rec|
begin
next if rec.css('td')[0].text.empty? or rec.css('td')[1].text.empty?
rescue

end

case rec.css('td')[0].text.to_s
	when "Interest Earned"
		profit_and_loss.interest_earnd_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.interest_earnd_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.interest_earnd_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.interest_earnd_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.interest_earnd_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Other Income"
		profit_and_loss.other_income_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.other_income_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.other_income_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.other_income_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.other_income_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Total Income"
		profit_and_loss.totl_income_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.totl_income_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.totl_income_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.totl_income_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.totl_income_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Interest expended"
		profit_and_loss.interest_expended_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.interest_expended_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.interest_expended_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.interest_expended_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.interest_expended_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Employee Cost"	
		profit_and_loss.employee_cost_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.employee_cost_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.employee_cost_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.employee_cost_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.employee_cost_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Selling, Admin & Misc Expenses"
		profit_and_loss.selling_admin_expense_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.selling_admin_expense_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.selling_admin_expense_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.selling_admin_expense_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.selling_admin_expense_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Depreciation"
		profit_and_loss.depreciation_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.depreciation_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.depreciation_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.depreciation_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.depreciation_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Preoperative Exp Capitalised"
		profit_and_loss.preoperv_exp_cap_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.preoperv_exp_cap_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.preoperv_exp_cap_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.preoperv_exp_cap_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.preoperv_exp_cap_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Operating Expenses"
		profit_and_loss.operating_expenses_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.operating_expenses_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.operating_expenses_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.operating_expenses_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.operating_expenses_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Provisions & Contingencies"
		profit_and_loss.provisions_contingencies_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.provisions_contingencies_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.provisions_contingencies_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.provisions_contingencies_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.provisions_contingencies_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Total Expenses"
		profit_and_loss.tot_expenses_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.tot_expenses_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.tot_expenses_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.tot_expenses_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.tot_expenses_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Net Profit for the Year"
		profit_and_loss.net_profit_yr_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.net_profit_yr_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.net_profit_yr_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.net_profit_yr_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.net_profit_yr_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Minority Interest"	
		profit_and_loss.minority_interest_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.minority_interest_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.minority_interest_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.minority_interest_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.minority_interest_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Share Of P/L Of Associates"	
		profit_and_loss.share_pl_associates_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.share_pl_associates_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.share_pl_associates_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.share_pl_associates_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.share_pl_associates_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Net P/L After Minority Interest & Share Of Associates"
		profit_and_loss.net_pl_aftr_min_intr_shr_ass_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.net_pl_aftr_min_intr_shr_ass_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.net_pl_aftr_min_intr_shr_ass_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.net_pl_aftr_min_intr_shr_ass_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.net_pl_aftr_min_intr_shr_ass_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Extraordinary Items"		
		profit_and_loss.extraordinary_items_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.extraordinary_items_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.extraordinary_items_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.extraordinary_items_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.extraordinary_items_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


	when "Profit brought forward"
		profit_and_loss.profit_brought_forward_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.profit_brought_forward_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.profit_brought_forward_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.profit_brought_forward_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.profit_brought_forward_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Total"
		profit_and_loss.total_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.total_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.total_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.total_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.total_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Preference Dividend"
		profit_and_loss.preference_dividend_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.preference_dividend_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.preference_dividend_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.preference_dividend_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.preference_dividend_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Equity Dividend"
		profit_and_loss.equity_dividend_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Corporate Dividend Tax"
		profit_and_loss.corporate_dividend_tax_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.corporate_dividend_tax_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.corporate_dividend_tax_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.corporate_dividend_tax_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.corporate_dividend_tax_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Earning Per Share (Rs)"
		profit_and_loss.eps_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.eps_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.eps_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.eps_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.eps_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Equity Dividend (%)"
		profit_and_loss.equity_dividend_perc_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_perc_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_perc_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_perc_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.equity_dividend_perc_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	
	when "Book Value (Rs)"
		profit_and_loss.book_value_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.book_value_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.book_value_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.book_value_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.book_value_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Transfer to Statutory Reserves"
		profit_and_loss.trns_statut_rserv_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.trns_statut_rserv_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.trns_statut_rserv_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.trns_statut_rserv_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.trns_statut_rserv_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Transfer to Other Reserves"
		profit_and_loss.trns_othr_rserv_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.trns_othr_rserv_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.trns_othr_rserv_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.trns_othr_rserv_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.trns_othr_rserv_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f

	when "Proposed Dividend/Transfer to Govt"
		profit_and_loss.propsd_dvdend_trans_govt_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.propsd_dvdend_trans_govt_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.propsd_dvdend_trans_govt_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.propsd_dvdend_trans_govt_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.propsd_dvdend_trans_govt_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


	when "Balance c/f to Balance Sheet"
		profit_and_loss.bal_cf_bal_sheet_0=rec.css('td')[1].nil? ? nil : rec.css('td')[1].text.gsub(/,/,'').to_f
		profit_and_loss.bal_cf_bal_sheet_1=rec.css('td')[2].nil? ? nil : rec.css('td')[2].text.gsub(/,/,'').to_f
		profit_and_loss.bal_cf_bal_sheet_2=rec.css('td')[3].nil? ? nil : rec.css('td')[3].text.gsub(/,/,'').to_f
		profit_and_loss.bal_cf_bal_sheet_3=rec.css('td')[4].nil? ? nil : rec.css('td')[4].text.gsub(/,/,'').to_f
		profit_and_loss.bal_cf_bal_sheet_4=rec.css('td')[5].nil? ? nil : rec.css('td')[5].text.gsub(/,/,'').to_f


end

end
profit_and_loss.save
fil.puts "profit_and_loss is saved"
end

end
end