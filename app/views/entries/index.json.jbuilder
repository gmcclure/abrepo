json.array!(@entries) do |entry|
  json.extract! entry, :citation, :annotation, :bibliography_id
  json.url entry_url(entry, format: :json)
end
