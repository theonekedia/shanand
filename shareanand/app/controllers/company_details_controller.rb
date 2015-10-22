class CompanyDetailsController < ApplicationController
    helper_method :sort_column, :sort_direction


def show
	@day_trading = DayTrading.find_by_nse_script_name(params[:nse_script_name])
	@comp_industry=DayTrading.where(:nse_script_name => params[:nse_script_name]).pluck(:industry)
    @compititors= DayTrading.where(:industry => @comp_industry).order("market_cap DESC")
    @ratios_and_analyses = RatiosAndAnalysis.where(:industry => @comp_industry)
    @risk_and_return = RiskAndReturn.find_by_nse_script_name(params[:nse_script_name])
    @ratios = RatiosAndAnalysis.find_by_nse_script_name(params[:nse_script_name])

    #@script_meta_datum = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
	#@ratios_and_analyses = RatiosAndAnalysis.find_by_nse_script_name(params[:nse_script_name])
	#@comp_industry=ScriptMetaDatum.where(:nse_script_name => params[:nse_script_name]).pluck(:industry)
	#@compititors= ScriptMetaDatum.where(:industry => @comp_industry)
	#compititors_array=ScriptMetaDatum.where(:industry => @comp_industry).pluck(:nse_script_name)
	#compititors_array.each do |compititor|
	#@ratios_and_analyses = RatiosAndAnalysis.where("nse_script_name IN (?)", compititors_array).order(sort_column + " " + sort_direction).to_a
	#@ratios_and_analyses = RatiosAndAnalysis.where(:nse_script_name => params[compititors_array])
	#@ratios_and_analyses = RatiosAndAnalysis.where(':nse_script_name => #{compititors_array}')

	#@gpm_chart=line_chart('Gross Profit Margin',@ratios_and_analyses.gross_profit_margin_0,@ratios_and_analyses.gross_profit_margin_1,@ratios_and_analyses.gross_profit_margin_2,@ratios_and_analyses.gross_profit_margin_3,@ratios_and_analyses.gross_profit_margin_4,'Profitable Ratios- GPM')
	#@opm_chart=line_chart('Operating Profit Margin',@ratios_and_analyses.oper_profit_margn_0,@ratios_and_analyses.oper_profit_margn_1,@ratios_and_analyses.oper_profit_margn_2,@ratios_and_analyses.oper_profit_margn_3,@ratios_and_analyses.oper_profit_margn_4,'Profitable Ratios- OPM')
	#@npm_chart=line_chart('Net Profit Margin',@ratios_and_analyses.net_proft_margn_0,@ratios_and_analyses.net_proft_margn_1,@ratios_and_analyses.net_proft_margn_2,@ratios_and_analyses.net_proft_margn_3,@ratios_and_analyses.net_proft_margn_4,'Profitable Ratios- NPM')
end

def update_bonus_share
    # any increase in nuber of shares
    # any decrease in the share price
    # need to create a table and form for update  bonus ratio    
end

def search
    @company_list= ScriptMetaDatum.search(params[:search])
    #uniq.pluck(:nse_script_name)
  end

def update_split
    # how about having the same table for bonus, split, yearly_dividend

end
=begin
def trading_details
# Display details from Daytrading table.
	@day_trading = DayTrading.find_by_nse_script_name(params[:nse_script_name])
	@script_meta_datum = ScriptMetaDatum.find_by_nse_script_name(params[:nse_script_name])
	render 
end	

def ratios_analysis
	@ratios_and_analyses = RatiosAndAnalysis.find_by_nse_script_name(params[:nse_script_name])

end

def compititors
	comp_industry=ScriptMetaDatum.find_by_nse_script_name(:nse_script_name).industry
	@compititors= ScriptMetaDatum.where('industry' = comp_industry)
	#select * from DayTrading where industry = @day_trading.industry order by Market_cap desc.
end	
=end

private
   def sort_column
    RatiosAndAnalysis.column_names.include?(params[:sort]) ? params[:sort] : "nse_script_name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


 def line_chart(title,cur_yr,cur_yr_1,cur_yr_2,cur_yr_3,cur_yr_4,heading)
  data_table = GoogleVisualr::DataTable.new
    data_table.new_column('string', 'Year')
    data_table.new_column('number', title)
    data_table.add_rows(5)
    data_table.set_cell(0, 0, '2010')
    data_table.set_cell(0, 1, cur_yr_4)
    
    data_table.set_cell(1, 0, '2011')
    data_table.set_cell(1, 1, cur_yr_3)

    data_table.set_cell(2, 0, '2012')
    data_table.set_cell(2, 1, cur_yr_2)
    
    data_table.set_cell(3, 0, '2013')
    data_table.set_cell(3, 1, cur_yr_1)
    
    data_table.set_cell(4, 0, '2014')
    data_table.set_cell(4, 1, cur_yr)
    
    opts   = { :width => 500, :height => 300, :title => heading, :legend => 'bottom' }
    @chart= GoogleVisualr::Interactive::LineChart.new(data_table, opts)
    #return @chart
    end

end
