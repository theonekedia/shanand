json.array!(@profit_and_losses) do |profit_and_loss|
  json.extract! profit_and_loss, :id
  json.url profit_and_loss_url(profit_and_loss, format: :json)
end
