json.array!(@schedules) do |schedule|
  #json.extract! schedule, :description, :start, :end
  json.description schedule.title
  json.start schedule.start.to_formatted_s(:db)
  json.end schedule.end.to_formatted_s(:db)
  json.allDay false
  json.url schedule_url(schedule, format: :html)
end