#whenver
module UpdateDayTrading
require 'csv'
class UpdateDayTrade
def self.get_csv_file
url='http://www.nseindia.com/content/equities/cmbhav.htm'
htmlpage=Nokogiri::HTML(open(url))
down_url="http://www.nseindia.com/" + htmlpage.xpath('//p[@class="contenttext"][1]/a/@href').to_s
#down_url="http://www.nseindia.com/content/historical/EQUITIES/2015/APR/cm10APR2015bhav"

down_file_name=down_url.split(/\//)[-1].split(/\./)[0]
month_name=Date::MONTHNAMES[Date.today.month]
yr=Date.today.year.to_s
content_folder="#{Rails.root}/content/nse_bhav_copy/#{yr}/#{month_name}"
#content_folder="/home/sradhu/MyProject/Source_code/shareanand/content/nse_bhav_copy/#{yr}/#{month_name}"

zip_file_name="#{content_folder}/zip/#{down_file_name}.csv.zip"
csv_file_name="#{content_folder}/CSV/#{down_file_name}.csv"

# Create the folders if not exist
FileUtils.mkdir_p(File.dirname(zip_file_name)) unless File.directory?("#{content_folder}/zip/")
FileUtils.mkdir_p(File.dirname(csv_file_name)) unless Dir::exist?("#{content_folder}/CSV/")

#Do nothing if the down_url doesnot contain csv.ZIP file.
unless down_url.match(/csv.zip/) == nil

#to download the zip file from the down_url.
File.open(zip_file_name, 'wb') do |fo|
  fo.print open(down_url).read 
end
end

#Extract the above zip file.
#def unzip_file(file, destination)
 Zip::ZipFile.open(zip_file_name) do |zip_file|
        zip_file.each do |f|
            #f_path=File.join(destination)
            f.extract(csv_file_name) # unless File.exist?(f_path)
        end
    end
return csv_file_name
end
#unzip_file(zip_file_name,csv_file_name)

#get_csv_file function ends here.

# call the function to get the file name.
def self.update_table

fil=File.open('/home/sradhu/BRM/Shareanand_rough/log.txt',"a")
csv_file= get_csv_file
#csv_file='/home/sradhu/MyProject/Source_code/shareanand/content/nse_bhav_copy/2015/June/CSV/cm12JUN2015bhav.csv'
fil.puts csv_file

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
    fil.puts symb
    DayTrading.find(symb).update( 
:today_open => arra[2].to_f,
:today_high => arra[3].to_f,
:today_low => arra[4].to_f,
:today_close => arra[5].to_f,	 
:pre_day_close => arra[7].to_f,	 
:tot_shares_traded => arra[8].to_f,
:perc_change => (arra[5].to_f - arra[7].to_f) * 100 / arra[7].to_f
)
end
end  # funct update_table ends here

end  # class ends here.
end  # module ends here.
