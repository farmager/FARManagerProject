json.array!(@croprotations) do |croprotation|
  json.extract! croprotation, :land_location, :planned_crop_year1, :year1,:planned_crop_year2, :year2,:planned_crop_year3, :year3
  json.url croprotation_url(croprotation, format: :json)
end