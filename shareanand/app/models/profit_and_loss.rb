class ProfitAndLoss < ActiveRecord::Base
self.primary_key = 'nse_script_name'
	belongs_to :ratios_and_analyses
end
