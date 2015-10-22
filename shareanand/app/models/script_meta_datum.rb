class ScriptMetaDatum < ActiveRecord::Base
self.primary_key = 'nse_script_name'
	has_one :balance_sheets
	has_one	:profit_and_losses

def self.search(search)
  if search
    find(:all,:conditions => ['nse_script_name LIKE ?', "#{search}"])
  else
    find(:all)
  end
end

end
