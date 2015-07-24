json.array!(@risk_and_returns) do |risk_and_return|
  json.extract! risk_and_return, :id
  json.url risk_and_return_url(risk_and_return, format: :json)
end
