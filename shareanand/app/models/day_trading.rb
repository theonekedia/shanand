class DayTrading < ActiveRecord::Base
	belongs_to  :script_meta_data
	self.primary_key = 'nse_script_name'
end
