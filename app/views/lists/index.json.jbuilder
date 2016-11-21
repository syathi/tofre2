json.array!(@lists) do |list|
  json.extract! list, :id, :refrigerator_id, :user_id, :event_id
  json.url list_url(list, format: :json)
end
