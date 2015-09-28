json.array!(@calendar_events) do |calendar_event|
  json.extract! calendar_event, :id, :title, :start_time, :endtime, :cost, :show_register_link, :show_donate_link, :childcare_available
  json.url calendar_event_url(calendar_event, format: :json)
end
