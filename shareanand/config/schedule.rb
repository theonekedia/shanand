#set :output, %W(#{config.root}/log/cron.log)

every :day, at: '1:53 am' do
  # specify the task name as a string
  rake "update:daily_share_price"
end