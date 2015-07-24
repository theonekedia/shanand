#set :output, %W(#{config.root}/log/cron.log)

every :day, at: '8:28pm' do
  # specify the task name as a string
  runner "update_daily:daily_share_price", :environment => 'development'
end