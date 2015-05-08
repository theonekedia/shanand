class BalanceSheet < ActiveRecord::Base
	belongs_to  :script_meta_data
	self.primary_key = 'nse_script_name'
	belongs_to :ratios_and_analyses
end
