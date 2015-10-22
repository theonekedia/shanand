#set :output, %W(#{config.root}/log/cron.log)

every :day, at: '06:14pm' do
  # specify the task name as a string
  rake "update_daily:daily_share_price"
  #rake "update:daily_share_price"
  #runner "update_daily:daily_share_price", :environment => 'development'
end