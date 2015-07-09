class FinancialsController < ApplicationController
	def show_balance_sheet
		  @balance_sheet = BalanceSheet.find_by_nse_script_name(params[:nse_script_name])
	end

	def show_profit_loss
		  @profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
	end

	def update_cur_yr_financials
		# to add current financial year's details
		# shift the _0 value to _1 and so..
		# shall I define the module and classes for this seperately ?
		# Or can I do it using stored procedures
		@balance_sheet = BalanceSheet.find_by_nse_script_name(params[:nse_script_name])
		@profit_and_loss = ProfitAndLoss.find_by_nse_script_name(params[:nse_script_name])
	end


end
