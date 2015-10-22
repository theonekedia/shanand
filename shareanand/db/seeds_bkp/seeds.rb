require 'csv'

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


fil=File.open('/home/sradhu/BRM/Shareanand_rough/log.txt',"a")
#csv_file = get_csv_file
csv_file=csv_file_name  #'/home/sradhu/risk_prgm/cm20JUL2015bhav.csv'
#fil.puts csv_file
def insert_lines_following_line(file,line_no)
  tmp_fn = "#{file}.tmp"
  File.open( tmp_fn, 'w' ) do |outf|
    line_ct = 0
    IO.foreach(file) do |line|
      outf.print line
      yield(outf) if line_no == (line_ct += 1)
    end
  end
  File.rename tmp_fn, file
end
#for each value find the row in csv file
   data = {}
  #read the csv file and store it in temp hash. 
   CSV.foreach(csv_file) do |row|
   sym=row[0]
   data.store(sym, row)
   end

search_arr = ["IGPL","BHARATRAS","CEBBCO","LYKALABS","INDOTECH","LUMAXAUTO","KEC","ZYLOG","AUSTRAL","ARIES","EROSMEDIA","JSWENERGY","NITINFIRE","APLAPOLLO","GRASIM","JYOTHYLAB","OUDHSUG","TECHNOFAB","BAYERCROP","EMKAY","TATAPOWER","DIGJAM","KOHINOOR","GINNIFILA","TRF","GODREJCP","NESCO","BHUSANSTL","CGCL","FSL","ATLANTA","RUPA","EKC","AARTIIND","PNBGILTS","MERCATOR","SAKUMA","CORPBANK","FILATEX","BAJAJELEC","SIYSIL","SMSPHARMA","RANASUG","GAIL","TRIDENT","TANLA","DISHMAN","SPYL","WELENT","DECCANCE","COLPAL","ADVANTA","SELMCL","BAJAJCORP","WHIRLPOOL","N100","AHLUCONT","GOLDSHARE","ARROWTEX","VESUVIUS","PENINLAND","ASTEC","SREINFRA","POLYPLEX","ACCELYA","VIPIND","DHUNINV","ESSDEE","RCF","JVLAGRO","GTNTEX","VIDEOIND","VIJSHAN","VOLTAS","NUCLEUS","MANPASAND","MANUGRAPH","INNOIND","SHRIASTER","STOREONE","MTNL","ALBK","GEINDSYS","UBL","SUNDARAM","ARSHIYA","SYNCOM","IOB","INFRATEL","ATFL","KSL","STEL","UTTAMSTL","SAKSOFT","VTL","RUSHIL","BIRLAERIC","GOLDBEES","EXCELCROP","EIHOTEL","SHRENUJ","FARMAXIND","BOMDYEING","IIFLNIFTY","SJVN","VGUARD","HFCL","ORIENTHOT","KIRLOSENG","CAPF","TECPRO","TATAELXSI","FMNL","CANBK","PIIND","BANKINDIA","QUINTEGRA","PVP","ADANIENT","J&KBANK","DHANBANK","STCINDIA","BEML","ALMONDZ","MVL","IRB","TATASTEEL","SUTLEJTEX","ROHLTD","NILKAMAL","GREENPLY","KAUSHALYA","DALMIABHA","NAHARCAP","PURVA","IITL","SUNTECK","OMKARCHEM","APTECHT","UGARSUGAR","KCP","SALSTEEL","ITDCEM","DABUR","BAJAJHIND","JUBLFOOD","BLUEDART","DHANUKA","LT","HATHWAY","POWERGRID","NCC","AFL","PREMIER","VSTIND","LAXMIMACH","SARDAEN","GMRINFRA","BGLOBAL","TATACHEM","AVTNPL","POLYMED","BEDMUTHA","MICROSEC","IOC","KSK","GOKUL","RKFORGE","SBBJ","PRIMESECU","RSWM","HOCL","MSPL","REVATHI","GAMMONIND","ASHIANA","UNIENTER","INDIANB","MERCK","GSFC","DWARKESH","TRIL","AMBUJACEM","TECHNO","SHREERAMA","SHARONBIO","DLF","SANGHIIND","STRTECH","LOTUSEYE","DALMIASUG","PATINTLOG","GPPL","CHROMATIC","VASCONEQ","HOVS","JSWSTEEL","DENORA","GATI","SUJANAUNI","STYABS","PFRL","SYNDIBANK","GOENKA","RICOAUTO","BIRLACOT","BALPHARMA","SHIRPUR-G","SOTL","KIRLOSIND","PROVOGE","MANDHANA","GUJNREDVR","RELDIVOPP","MALWACOTT","RALLIS","SYMPHONY","ARSSINFRA","PATELENG","ATULAUTO","ONWARDTEC","CLNINDIA","DELTACORP","ADHUNIK","TIIL","IDBI","RAMANEWS","AGCNET","IDEA","ZUARI","NOIDATOLL","ESSELPACK","SONASTEER","ANIKINDS","GTNIND","ELGIEQUIP","MUKANDLTD","GITANJALI","RUCHIRA","SEINV","SOMATEX","MEP","CCCL","PRECOT","XPROINDIA","PRADIP","UNIPLY","BINANIIND","IVP","FCSSOFT","SBT","JOCIL","ASAHISONG","SITASHREE","REDINGTON","NETWORK18","CADILAHC","BRIGADE","SHLAKSHMI","CENTRALBK","BIOCON","TFCILTD","GEECEE","DISHTV","M&MFIN","EMMBI","MAHLIFE","SUBROS","ASAL","MEGH","JBFIND","3MINDIA","EDL","RCOM","BPCL","IMPAL","GUJAPOLLO","SANWARIA","SKSMICRO","SHILPI","EDELWEISS","KOTAKBANK","FORTIS","ADORWELD","DEEPIND","KWALITY","CESC","PLETHICO","SEZAL","KECL","CHOLAFIN","FDC","UNITEDBNK","BHEL","JIKIND","MBECL","BILPOWER","SWARAJENG","IVC","ISMTLTD","SBIN","MEGASOFT","ZODJRDMKJ","GODREJIND","RAMCOIND","ICRA","MRO-TEK","MARICO","PPAP","TRIGYN","HIRECT","TNPL","TARMAT","KEI","SIL","MARUTI","SCHNEIDER","PIONDIST","ADLABS","ELECTHERM","GUFICBIO","KMSUGAR","COUNCODOS","HEXAWARE","RELINFRA","KTKBANK","PTC","GSKCONS","BOSCHLTD","BSLIMITED","RAMCOSYS","BRITANNIA","RUCHISOYA","MAANALU","ESTER","AHLEAST","MOIL","DBCORP","TODAYS","SPARC","BALAMINES","DHARSUGAR","PFIZER","AUSOMENT","GREENFIRE","CANTABIL","SUPRAJIT","FINANTECH","SPIC","DHFL","RAMSARUP","SURANASOL","BASF","KIL","KGL","DTIL","LOVABLE","BANARISUG","GOLDIAM","INFINITE","NELCO","RASOYPR","HEG","CEATLTD","SOBHA","MADHAV","PARSVNATH","AMDIND","RJL","JKTYRE","HINDUJAFO","INGERRAND","RAMKY","BLISSGVS","MRF","RAJVIR","SWELECTES","HERCULES","ORBITCORP","PANAMAPET","NAGAROIL","SINTEX","INDOTHAI","JAMNAAUTO","AIL","AMTEKAUTO","GLOBOFFS","KPIT","PTL","SUZLON","NIBL","HILTON","TEXRAIL","TECHM","TIL","SHILPAMED","TULSI","OMNITECH","WSI","CRMFGETF","KCPSUGIND","HUBTOWN","ECLERX","ZICOM","KICL","INDHOTEL","TI","RKDL","INDOSOLAR","GOKEX","GOACARBON","MMFL","HCC","IGARASHI","HDIL","GAYAPROJ","GABRIEL","ARCHIDPLY","PRAJIND","PRATIBHA","XLENERGY","TATACOMM","BLKASHYAP","GSPL","ARVINDREM","JSL","JKLAKSHMI","MIC","ASSAMCO","KPRMILL","CRISIL","STARPAPER","PBAINFRA","FIEMIND","ALKALI","RML","CANDC","POCHIRAJU","MAGMA","KSCL","PGHH","UFLEX","SAGCEM","NITESHEST","USHAMART","KESARENT","GENESYS","NFL","MINDTREE","CAREERP","AURIONPRO","SIEMENS","GVKPIL","USHERAGRO","NTPC","WEIZFOREX","GAL","VISASTEEL","INDORAMA","HCIL","COX&KINGS","HMT","HBLPOWER","MOSERBAER","ECEIND","TVSMOTOR","ABAN","MURLIIND","SMPL","RELNIFTY","EMAMILTD","RSYSTEMS","NELCAST","RBL","EMCO","CCL","RESPONIND","RPPINFRA","CIMMCO","MAHABANK","HANUNG","DENABANK","VOLTAMP","NESTLEIND","BSL","ICICIBANK","GRINDWELL","KIRIINDUS","KITEX","MUNJALAU","SMARTLINK","FINPIPE","HONAUT","ESL","FINCABLES","WELCORP","HGS","ALOKTEXT","WINSOME","CONCOR","ALCHEM","GAEL","ABB","KTIL","ALLSEC","COALINDIA","GRAPHITE","SELAN","JINDRILL","SGJHL","CMC","IOLCP","NEPCMICON","L&TFH","ACROPETAL","JCTEL","IDFC","VIKASGLOB","PRAENG","BSELINFRA","AARVEEDEN","OISL","TNPETRO","ARCHIES","MINDACORP","SRF","ASTRAZEN","UCALFUEL","20MICRONS","HINDALCO","NITINSPIN","HIKAL","ORIENTPPR","HIL","KALINDEE","LUMAXIND","JUBLINDS","CENTEXT","JBMA","RMCL","RAYMOND","MANGLMCEM","TWL","ACE","8KMILES","SOLARINDS","TBZ","CTE","NIITLTD","ARROWCOAT","APLLTD","AKZOINDIA","ORIENTREF","THERMAX","IGL","VENUSREM","ITC","PGEL","SKFINDIA","IFBAGRO","INFOMEDIA","V2RETAIL","STERTOOLS","EVERONN","AJMERA","SMLISUZU","ADFFOODS","INVENTURE","SURANAIND","INDOCO","GIPCL","SEAMECLTD","LGBFORGE","ARVIND","IPCALAB","UCOBANK","AUTOAXLES","KEMROCK","UNITECH","BLUECHIP","PRICOL","KOPRAN","TTL","KOTARISUG","MANAKSIA","KSBPUMPS","SHYAMTEL","NIITTECH","GTLINFRA","IBREALEST","RAJOIL","ALLCARGO","AEGISCHEM","AGRITECH","GNFC","XCHANGING","RELIANCE","WANBURY","RPOWER","GSS","NAKODA","MMTC","KARMAENG","BIL","RIIL","THEMISMED","GILLETTE","SUNTV","GRAVITA","EIDPARRY","ABGSHIP","JPPOWER","BANSWRAS","BBL","BVCL","EXIDEIND","ENIL","RAMCOCEM","ANGIND","ASTRAL","DPSCLTD","HDFCBANK","SUNFLAG","HESTERBIO","REPRO","HCLTECH","LML","AXISBANK","NUTEK","SANOFI","ALPHAGEO","NCLIND","SUPERSPIN","RELCONS","TEXINFRA","BGRENERGY","LAKPRE","GOLDINFRA","MINDAIND","MURUDCERA","UJAAS","YESBANK","RMMIL","TRICOM","ELGIRUBCO","GESHIP","UNITEDTEA","REPCOHOME","ALPSINDUS","MAX","DICIND","GTL","DIVISLAB","KAKATCEM","JKPAPER","INDNIPPON","VSSL","KANSAINER","BEL","PEL","MARKSANS","NECLIFE","TIMKEN","CELESTIAL","BALLARPUR","SDBL","TIDEWATER","ZYDUSWELL","SPMLINFRA","GRANULES","JKCEMENT","HCL-INSYS","BBTC","SUBEX","CPSEETF","RECLTD","PETRONET","TAJGVK","PITTILAM","NBCC","NAHARPOLY","CALSOFT","GDL","SUMMITSEC","PRAKASH","DIAPOWER","FLEXITUFF","PSL","MADHUCON","WIPRO","OCL","PENIND","GMBREW","SUJANATWR","ACC","ERAINFRA","CIPLA","VKSPL","ISFT","UNIONBANK","SHIVTEX","MORARJEE","NCOPPER","ZEEL","IL&FSTRANS","GUJALKALI","RUBYMILLS","AHLWEST","PFC","BPL","SICAL","LICHSGFIN","DBREALTY","PNB","INDLMETER","KANANIIND","SAKHTISUG","TCI","IL&FSENGG","GEMINI","BATAINDIA","MRPL","PRESTIGE","GUJFLUORO","METKORE","HINDPETRO","HAVELLS","BANG","SERVALL","MAXWELL","WENDT","HSIL","CYBERTECH","NICCO","PGIL","ROLTA","BRFL","RELCNX100","AIAENG","LUMAXTECH","TIMBOR","ATUL","EDUCOMP","ICIL","ICSA","IBWSL","COMPUSOFT","FOSECOIND","ZEELEARN","RELIGARE","INDBANK","ZENITHBIR","PAPERPROD","JAIBALAJI","ANSALAPI","DCM","JINDCOT","MASTEK","OFSS","SUPPETRO","NMDC","ANANTRAJ","VARUNSHIP","CLASSIC","INFRABEES","FMGOETZE","VEDL","WHEELS","RUCHINFRA","MBLINFRA","NITCO","MAWANASUG","RENUKA","CENTUM","JKIL","LITL","JINDWORLD","ASHOKA","VIPULLTD","VIMTALABS","SOUTHBANK","IFBIND","DAAWAT","GLENMARK","ABCIL","TINPLATE","M&M","GLOBUSSPR","JAYAGROGN","CUB","MARALOVER","VHL","CAIRN","IFCI","SIMPLEX","TVSELECT","ITI","DEEPAKNTR","GICHSGFIN","SSWL","JUBILANT","GALLISPAT","ESSAROIL","HOTELEELA","ORIENTLTD","GLAXO","TITAN","INDOWIND","SANDESH","RPGLIFE","SAIL","RELAXO","BFINVEST","OMAXE","EICHERMOT","MHRIL","SHREYAS","TCS","SUVEN","PDPL","GEOMETRIC","ASHIMASYN","HDFC","SADBHAV","ADSL","PRISMCEM","KERNEX","INFY","CERA","GPIL","AMBIKCO","AUTOIND","EUROCERA","MAGNUM","KILITCH","IDBIGOLD","NSIL","TRENT","RATNAMANI","VICEROY","IMFA","PFS","VISAKAIND","NHPC","SUDAR","GRUH","JAGRAN","BILENERGY","HBSTOCK","GOLDTECH","MANINDS","VENKEYS","LAOPALA","ZUARIGLOB","EVEREADY","VISUINTL","ONMOBILE","SARLAPOLY","STAR","KNRCON","SEPOWER","ENERGYDEV","GMDCLTD","UNITY","POLARIS","SANGAMIND","CMAHENDRA","AXISGOLD","INDIACEM","DONEAR","KRBL","LUPIN","WELINV","ALICON","PSB","MOHITIND","OIL","RADICO","MPSLTD","SILINV","TREEHOUSE","ESCORTS","KKCL","DCW","PAEL","ONGC","MONSANTO","BEPL","SHREECEM","M50","PRECWIRE","PAGEIND","A2ZINFRA","RAJRAYON","NOCIL","MPHASIS","OMMETALS","APARINDS","TRIVENI","ASHOKLEY","MTEDUCARE","WABAG","MIRZAINT","SASKEN","ESABINDIA","DRREDDY","GALLANTT","FACT","CELEBRITY","AGRODUTCH","TTML","SUNPHARMA","MCX","TIMESGTY","ANSALHSG","GHCL","ELECTCAST","PUNJLLOYD","CENTENKA","MAYURUNIQ","TARAPUR","SCI","SBIGETS","BROOKS","SICAGEN","HINDZINC","VALUEIND","BURNPUR","MANINFRA","OMAXAUTO","TAKE"]
#get all NSE_script_names from day_trading table and assign it to array.
#search_arr=DayTrading.uniq.pluck(:nse_script_name)

#for each value in array update the day trading table. 
search_arr.each do |symb|
	symb.rstrip.lstrip!
     arra= data[symb]
     next if arra.nil?
     arra.map!{|v| v.to_s}   
csv_to_update = '/home/sradhu/MyProject/Source_code/shareanand/content/nse_hist_tbl_csv/'+ symb + '_hist_tbl.csv'
insert_lines_following_line(csv_to_update,1) do |outf|
  outf.puts [Date.parse(arra[10]),arra[2].to_f,arra[3].to_f,arra[4].to_f,arra[5].to_f,arra[8].to_f,arra[6].to_f].join(",")
end

fil.puts symb

next if DayTrading.find_by_nse_script_name(symb).nil?
daytrading=DayTrading.find_by_nse_script_name(symb)
DayTrading.find(symb).update( 
    :today_open => arra[2].to_f,
    :today_high => arra[3].to_f,
    :today_low => arra[4].to_f,
    :today_close => arra[5].to_f,	 
    :pre_day_close => arra[7].to_f,	 
    :tot_shares_traded => arra[8].to_f,
    :perc_change => (arra[5].to_f - arra[7].to_f) * 100 / arra[7].to_f,
    :market_cap => daytrading.tot_outstanding_shares.to_f * arra[5].to_f,
    :pe_ratio => (daytrading.eps.nil? || daytrading.eps.to_f == 0 ) ? nil : arra[5].to_f / daytrading.eps.to_f 

)

# finding risk and return details and updating the risk_and_return table starts here
one_yr_back_date = Date.today - 365
six_months_back_date = Date.today - 180
three_months_back_date = Date.today - 90
one_month_back_date = Date.today - 30

one_month_data = []
three_months_data = []
six_months_data = []
one_yr_data = []

CSV.foreach(csv_to_update,{:headers => :first_row }) do |row|
    
  if  Date.parse(row[0]) > one_month_back_date
    one_month_data << row[4]
  end

  if Date.parse(row[0]) > three_months_back_date 
    three_months_data << row[4]
  end

  if Date.parse(row[0]) > six_months_back_date
    six_months_data << row[4]
  end
      
  if Date.parse(row[0]) > one_yr_back_date
    one_yr_data << row[4]
  end
end

def risk_return(data,x)
  stats = DescriptiveStatistics::Stats.new(data)
  mean = stats.mean.round(2)
  variance = stats.variance.round(2)
  sigma = stats.standard_deviation.round(2)
  z = ((x- mean)/sigma).round(2)
  probility = ZTable.where(:z_value => z)
  return mean, sigma, z, stats.max, stats.min, (sigma/mean).round(2), probility
end 

x = arra[5].to_f

if RiskAndReturn.find_by_nse_script_name(symb).nil?
begin  
  ris_ret=RiskAndReturn.new
  ris_ret.industry = daytrading.industry
  ris_ret.isi_num = daytrading.isi_num
  ris_ret.nse_script_name = daytrading.nse_script_name
  ris_ret.one_yr_mean, ris_ret.one_yr_sigma,ris_ret.z_1_yr,ris_ret.one_yr_high,ris_ret.one_yr_low,ris_ret.co_var_one_yr,ris_ret.probablty_grtr_x_one_yr = risk_return(one_yr_data,x)
  ris_ret.six_months_mean, ris_ret.six_months_sigma,ris_ret.z_6_months,ris_ret.six_months_high,ris_ret.six_months_low,ris_ret.co_var_six_months,ris_ret.probablty_grtr_x_six_months = risk_return(six_months_data,x)
  ris_ret.three_months_mean, ris_ret.three_months_sigma, ris_ret.z_3_months,ris_ret.three_months_high,ris_ret.three_months_low,ris_ret.co_var_three_months,ris_ret.probablty_grtr_x_three_months = risk_return(three_months_data,x)
  ris_ret.one_month_mean, ris_ret.one_month_sigma, ris_ret.z_1_months,ris_ret.one_month_high,ris_ret.one_month_low,ris_ret.co_var_one_month,ris_ret.probablty_grtr_x_one_month = risk_return(one_month_data,x)
  ris_ret.save
rescue
  fil.puts "got error"
next
end
else
one_yr_mean, one_yr_sigma,z_1_yr,one_yr_high,one_yr_low,co_var_one_yr,probablty_grtr_x_one_yr = risk_return(one_yr_data,x)
six_months_mean, six_months_sigma,z_6_months,six_months_high,six_months_low,co_var_six_months,probablty_grtr_x_six_months = risk_return(six_months_data,x)
three_months_mean, three_months_sigma, z_3_months,three_months_high,three_months_low,co_var_three_months,probablty_grtr_x_three_months = risk_return(three_months_data,x)
one_month_mean, one_month_sigma, z_1_months,one_month_high,one_month_low,co_var_one_month,probablty_grtr_x_one_month = risk_return(one_month_data,x)


 RiskAndReturn.find_by_nse_script_name(symb).update(
:one_yr_mean => one_yr_mean,
:one_yr_sigma => one_yr_sigma,
:z_1_yr => z_1_yr,
:one_yr_high => one_yr_high,
:one_yr_low => one_yr_low,
:co_var_one_yr => co_var_one_yr,
:probablty_grtr_x_one_yr => probablty_grtr_x_one_yr,
:six_months_mean => six_months_mean,
:six_months_sigma => six_months_sigma,
:z_6_months => z_6_months,
:six_months_high => six_months_high,
:six_months_low => six_months_low,
:co_var_six_months => co_var_six_months,
:probablty_grtr_x_six_months => probablty_grtr_x_six_months,
:three_months_mean => three_months_mean,
:three_months_sigma => three_months_sigma,
:z_3_months => z_3_months,
:three_months_high => three_months_high,
:three_months_low => three_months_low,
:co_var_three_months => co_var_three_months,
:probablty_grtr_x_three_months => probablty_grtr_x_three_months,
:one_month_mean => one_month_mean,
:one_month_sigma => one_month_sigma,
:z_1_months => z_1_months,
:one_month_high => one_month_high,
:one_month_low => one_month_low,
:co_var_one_month => co_var_one_month,
:probablty_grtr_x_one_month => probablty_grtr_x_one_month
)
# ris_ret.industry_index also pending.
# calculating beta values is pending.
# finding risk and return details and updating the risk_and_return table ends here

end   # search array loop ends here.
end