search_arr=DayTrading.uniq.pluck(:nse_script_name)
script_data = nil
search_arr.each do |symb|
	script_data= ScriptMetaDatum.find_by_nse_script_name(symb)

	DayTrading.find(symb).update(  
		:f2_week_low => script_data.f2_week_low,
		:f2_week_high => script_data.f2_week_high)
end




