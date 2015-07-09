# This program is to update on Daily basis.
require 'csv'
csv_file='/home/sradhu/MyProject/Source_code/shareanand/content/nse_bhav_copy/2015/April/CSV/cm10APR2015bhav.csv'

search_arr=ScriptMetaDatum.uniq.pluck(:nse_script_name)

   data = {}
  #read the csv file and store it in temp hash. 
   CSV.foreach(csv_file) do |row|
   sym=row[0]
   data.store(sym, row)
   end
 #first insert once
 fil=File.open('/home/sradhu/BRM/Shareanand_rough/log.txt',"a")
 #fil.puts data
 #fil.puts search_arr
 # later on update every day


search_arr.each do |symb|
	symb.rstrip!
     arra= data[symb]
     next if arra.nil?
     arra.map!{|v| v.to_s}
    fil.puts symb
    fil.puts arra

    daytrading=DayTrading.new
    
daytrading.isi_num = arra[12]
daytrading.nse_script_name = symb
daytrading.today_open = arra[2].to_f
daytrading.today_high = arra[3].to_f
daytrading.today_low = arra[4].to_f
daytrading.today_close =arra[5].to_f	 
daytrading.pre_day_close =arra[7].to_f	 
daytrading.tot_shares_traded =arra[8].to_f
daytrading.perc_change = (arra[5].to_f - arra[7].to_f) * 100 / arra[7].to_f

#daytrading.market_cap = number of shares * arra[5].to_f

daytrading.save
fil.puts "#{symb} data is loaded into day_tradings table"
end


=begin  

def search_in_csv(input_csv,search_arr,output_csv)
   data = {}
  #read the csv file and store it in temp hash. 
   CSV.foreach(input_csv) do |row|
   sym=row[0]
   data.store(sym, row)
   end
   
fil=File.open('/home/sradhu/BRM/log.txt',"a")
   search_arr.each do |symb|
   fil.puts data[symb].class
   fil.puts data[symb]
   end

 CSV.open(output_csv, "wb") do |csv|  
	search_arr.each do |symb|
		 csv << data[symb]  
	end
 end	

end
search_criteria = ['TCS','RELIANCE','ONGC','INFY','IOB','ITC','NTPC'].sort
#search_in_csv(csv_file,search_criteria,"/home/sradhu/BRM/2015/FEB/main_list.csv")
# Reading the above CSV file ends
=end
