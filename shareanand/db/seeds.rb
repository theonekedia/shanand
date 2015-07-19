

main_url='http://www.moneycontrol.com/stocks/marketinfo/marketcap/nse/index.html'
fil=File.open('/home/sradhu/BRM/Shareanand_rough/log_seeds.txt',"a")


index_doc = Nokogiri::HTML(open(main_url))
left_menu=index_doc.xpath('//div[@class="lftmenu"]/ul/li/a')
left_menu.each do |left_lnk| 
list_html='http://www.moneycontrol.com' + left_lnk["href"]

#main_url.each do |list_html|
index_doc = Nokogiri::HTML(open(list_html))
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

if ScriptMetaDatum.find_by_nse_script_name(mt_detl["NSE"]).nil? == false  # check if the record is there in script_meta_data table
if CashFlowStatement.find_by_nse_script_name(mt_detl["NSE"]).nil?

#script_industry=mt_detl["SECTOR"]
script_industry=doc.xpath('//div[@class="FL gry10"]/a["href"]/text()').to_s.strip.gsub(/&amp;/,'&') #if mt_detl["SECTOR"].nil?
fil.puts script_industry

fil.puts mt_detl
# It will give you the Finacial Page links. It is from page's total links table.
fin_links=doc.xpath('//div[@class="PT35"]/table/tr/td[4]/ul/li/a')
cash_flow_link='http://www.moneycontrol.com' + fin_links.css('a')[6]['href']


cash_flow_doc=Nokogiri::HTML(open(cash_flow_link))


begin
	consolidated_cashflow_link='http://www.moneycontrol.com' + cash_flow_doc.xpath('//div[@class="tabns MR15"]/ul/li[2]/a').css('a')[0]["href"]
	
rescue
	consolidated_cashflow_link=cash_flow_link
	
end


fil.puts consolidated_cashflow_link

cash_flow_page = Nokogiri::HTML(open(consolidated_cashflow_link))

c_f_sheet = cash_flow_page.xpath('//table[@class="table4"][3]/tr')

cash_flow_statement = CashFlowStatement.new

cash_flow_statement.industry=script_industry
cash_flow_statement.isi_num=mt_detl["ISIN"]
cash_flow_statement.nse_script_name=mt_detl["NSE"]

#cash_flow_statement.last_updated_year = c_f_sheet.css('tr')[0]['td'][1].text.to_s

c_f_sheet.collect do |row|
begin
next if row.css('td')[0].text.empty? or row.css('td')[1].text.empty?
rescue

end



case row.css('td')[0].text.to_s
when "Net Profit Before Tax"
cash_flow_statement.net_profit_bfr_tax_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.net_profit_bfr_tax_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.net_profit_bfr_tax_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.net_profit_bfr_tax_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.net_profit_bfr_tax_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f


when "Net Cash From Operating Activities"
cash_flow_statement.net_cash_4m_operating_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_4m_operating_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_4m_operating_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_4m_operating_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_4m_operating_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Net Cash (used in)/from Investing Activities"
cash_flow_statement.net_cash_investing_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_investing_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_investing_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_investing_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_investing_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Net Cash (used in)/from Financing Activities"
cash_flow_statement.net_cash_financing_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_financing_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_financing_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_financing_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.net_cash_financing_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Net (decrease)/increase In Cash and Cash Equivalents"
cash_flow_statement.net_chng_in_cash_equivs_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.net_chng_in_cash_equivs_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.net_chng_in_cash_equivs_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.net_chng_in_cash_equivs_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.net_chng_in_cash_equivs_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Opening Cash & Cash Equivalents"
cash_flow_statement.opening_cash_equivs_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.opening_cash_equivs_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.opening_cash_equivs_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.opening_cash_equivs_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.opening_cash_equivs_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

when "Closing Cash & Cash Equivalents"
cash_flow_statement.closing_cash_equivs_0 = row.css('td')[1].nil? ? nil : row.css('td')[1].text.gsub(/,/,'').to_f
cash_flow_statement.closing_cash_equivs_1 = row.css('td')[2].nil? ? nil : row.css('td')[2].text.gsub(/,/,'').to_f
cash_flow_statement.closing_cash_equivs_2 = row.css('td')[3].nil? ? nil : row.css('td')[3].text.gsub(/,/,'').to_f
cash_flow_statement.closing_cash_equivs_3 = row.css('td')[4].nil? ? nil : row.css('td')[4].text.gsub(/,/,'').to_f
cash_flow_statement.closing_cash_equivs_4 = row.css('td')[5].nil? ? nil : row.css('td')[5].text.gsub(/,/,'').to_f

end

cash_flow_statement.save

end
else
	next
end

else
	next
end
end
end

