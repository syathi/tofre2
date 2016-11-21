json.array!(@events) do |event|
  json.extract! event, :id, :refrigerator_id, :place, :date, :upper_num, :lower_num
  json.url event_url(event, format: :json)
end
