class CompanyDetailsController < ApplicationController


def trading_details
# Display details from Daytrading table.
	@day_trading = DayTrading.find_by_nse_script_name(params[:nse_script_name])
end	

def ratios_analysis
	@ratios_and_analysis = RatiosAndAnalysis.find_by_nse_script_name(params[:nse_script_name])

end

def graham_vs_price	
	# dislay the scripts for which price is less than graham value
	# select * from DayTrading where graham_fvp > day_close.


end
def compititors
	#select * from DayTrading where industry = @day_trading.industry order by Market_cap desc.
end	

end
