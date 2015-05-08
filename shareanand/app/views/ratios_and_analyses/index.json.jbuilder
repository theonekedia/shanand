json.array!(@ratios_and_analyses) do |ratios_and_analysis|
  json.extract! ratios_and_analysis, :id
  json.url ratios_and_analysis_url(ratios_and_analysis, format: :json)
end
