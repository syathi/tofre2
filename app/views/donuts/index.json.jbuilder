json.array!(@donuts) do |donut|
  json.extract! donut, :id, :user_id, :title
  json.url donut_url(donut, format: :json)
end
