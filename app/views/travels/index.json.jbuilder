json.array!(@travels) do |travel|
  json.extract! travel, :id, :from, :to, :datetime, :user_id, :medium
  json.url travel_url(travel, format: :json)
end
