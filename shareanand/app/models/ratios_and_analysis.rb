class RatiosAndAnalysis < ActiveRecord::Base
self.primary_key = 'nse_script_name'
	has_one :balance_sheets
	has_one	:profit_and_losses
end
