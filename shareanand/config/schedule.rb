set :output, %W(#{config.root}/log/cron.log)

every :day, at: '8:55 pm' do
  # specify the task name as a string
  rake "update:daily_share_price"
end