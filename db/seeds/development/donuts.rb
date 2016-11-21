icon = ["donut1","donut2","donut3","donut4"]

0.upto(9) do |idx|
    
    path = Rails.root.join("db/seeds/development", "#{icon[idx/4]}.jpeg")
    file = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
    
    Donut.create(
        user_id: (idx % 5) + 1,
        title: "ドーナツ#{idx + 1}",
        material: "ここにドーナツの材料やら調味料のデータが入る予定。",
        image: file
    )
end