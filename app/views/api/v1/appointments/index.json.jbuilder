json.array! @appointments do |app|
  json.date_create app.created_at
  json.id app.id
  json.date app.date
  json.status app.status
  json.duration app.duration
  json.restaurant app.restaurant[:name]
  json.location app.restaurant[:location]
end
