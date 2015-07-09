main_url='http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/index.html' # bank index url

fil=File.open('/home/sradhu/BRM/Shareanand_rough/log_seeds.txt',"a")

index_doc = Nokogiri::HTML(open(main_url))
links_page=index_doc.xpath('//table[@class="tbldata14 bdrtpg"]/tr/td[1]/a')
links_page.each do |lnk| 
html='http://www.moneycontrol.com' + lnk["href"]
doc = Nokogiri::HTML(open(html))

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