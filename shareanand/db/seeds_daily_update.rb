require 'csv'

csv_file= '/home/sradhu/MyProject/Source_code/shareanand/content/nse_bhav_copy/2015/July/CSV/cm16JUL2015bhav.csv'
search_arr=DayTrading.uniq.pluck(:nse_script_name)

#for each value find the row in csv file
   data = {}
  #read the csv file and store it in temp hash. 
   CSV.foreach(csv_file) do |row|
   sym=row[0]
   data.store(sym, row)
   end
#for each value in array update the day trading table. 
 search_arr.each do |symb|
	symb.rstrip.lstrip!
     arra= data[symb]
     next if arra.nil?
     arra.map!{|v| v.to_s}   
    daytrading=DayTrading.find(symb)

    DayTrading.find(symb).update({    
:today_open => arra[2].to_f,
:today_high => arra[3].to_f,
:today_low => arra[4].to_f,
:today_close => arra[5].to_f,	 
:pre_day_close => arra[7].to_f,	 
:tot_shares_traded => arra[8].to_f,
:perc_change => (arra[5].to_f - arra[7].to_f) * 100 / arra[7].to_f,
:market_cap => daytrading.tot_outstanding_shares.to_f * arra[5].to_f,
:pe_ratio => (daytrading.eps.nil? || daytrading.eps.to_f == 0 ) ? nil : arra[5].to_f / daytrading.eps.to_f 
})
end
