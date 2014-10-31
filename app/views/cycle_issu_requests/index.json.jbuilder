json.array!(@cycle_issu_requests) do |cycle_issu_request|
  json.extract! cycle_issu_request, :id, :cycleid, :studentid, :to, :from
  json.url cycle_issu_request_url(cycle_issu_request, format: :json)
end
