json.array!(@script_meta_data) do |script_meta_datum|
  json.extract! script_meta_datum, :id
  json.url script_meta_datum_url(script_meta_datum, format: :json)
end
