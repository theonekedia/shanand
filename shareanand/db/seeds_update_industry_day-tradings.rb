search_arr=DayTrading.uniq.pluck(:nse_script_name)
script_data = nil
search_arr.each do |symb|
	script_data= ScriptMetaDatum.find_by_nse_script_name(symb)

	DayTrading.find(symb).update(  
		:industry => script_data.industry)
end




