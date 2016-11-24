json.array!(@refrigerators) do |refrigerator|
  json.extract! refrigerator, :id, :user_id, :name, :quantity, :deadline, :public
  json.url refrigerator_url(refrigerator, format: :json)
end
