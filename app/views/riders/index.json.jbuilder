json.array!(@riders) do |rider|
  json.extract! rider, :id, :source, :destination
  json.url rider_url(rider, format: :json)
end
