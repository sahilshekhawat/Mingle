json.travel do
  json.id    @travel.id
  json.tlatitude @travel.tlatitude
  json.tlongitude @travel.tlongitude
  json.flatitude @travel.flatitude
  json.flongitude @travel.flongitude
  json.from @travel.from
  json.to @travel.to
  json.datetime @travel.datetime
  json.user_id @travel.user_id
  json.medium @travel.medium
end