# This program is to update on Daily basis.
require 'csv'
#csv_file='/home/sradhu/MyProject/Source_code/shareanand/content/nse_bhav_copy/2015/April/CSV/cm10APR2015bhav.csv'

fil=File.open('/home/sradhu/BRM/Shareanand_rough/log.txt',"a")
#csv_file= get_csv_file
csv_file='/home/sradhu/MyProject/Source_code/shareanand/content/nse_bhav_copy/2015/July/CSV/cm16JUL2015bhav.csv'
#fil.puts csv_file

#open csv file

#get all NSE_script_names from day_trading table and assign it to array.
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
    
    DayTrading.find(symb).update( 
:today_open => arra[2].to_f,
:today_high => arra[3].to_f,
:today_low => arra[4].to_f,
:today_close => arra[5].to_f,  
:pre_day_close => arra[7].to_f,  
:tot_shares_traded => arra[8].to_f,
:perc_change => (arra[5].to_f - arra[7].to_f) * 100 / arra[7].to_f
)
    fil.puts "#{symb} data is loaded."
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
