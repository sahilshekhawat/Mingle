json.array!(@cycles) do |cycle|
  json.extract! cycle, :id, :cycle_id
  json.url cycle_url(cycle, format: :json)
end
