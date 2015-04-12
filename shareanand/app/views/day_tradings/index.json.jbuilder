json.array!(@day_tradings) do |day_trading|
  json.extract! day_trading, :id
  json.url day_trading_url(day_trading, format: :json)
end
