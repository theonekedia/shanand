namespace :update_daily do
	desc "Send daily task reminders"
	task :daily_share_price => :environment do
		UpdateDayTrading::UpdateDayTrade.update_table
 	end
 end