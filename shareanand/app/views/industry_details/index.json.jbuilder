json.array!(@industry_details) do |industry_detail|
  json.extract! industry_detail, :id
  json.url industry_detail_url(industry_detail, format: :json)
end
