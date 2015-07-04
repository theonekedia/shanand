#set :output, %W(#{config.root}/log/cron.log)

every :day, at: '10:26 pm' do
  # specify the task name as a string
  rake "update:daily_share_price"
end