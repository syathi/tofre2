
0.upto(15) do |idx|
  Refrigerator.create(
    user_id: (idx % 3) + 1,
    name: "食品#{idx}",
    quantity: (idx % 3) + 1,
    purchase: 1.weeks.ago.advance(days: idx),
    deadline: 1.weeks.from_now.advance(days: idx),
    release: idx%2
  )
end

0.upto(15) do |idx|
  Refrigerator.create(
    user_id: (idx % 3) + 1,
    name: "野菜#{idx}",
    quantity: (idx % 3) + 1,
    purchase: 1.weeks.ago.advance(days: idx),
    deadline: nil,
    release: idx%2
  )
end

food = ["食パン","牛乳","卵","ベーコン","納豆","ドレッシング","ハム","ふりかけ"]
fresh = ["りんご","ピーマン","マグロ","キャベツ","バナナ","タマネギ","トマト","みかん"]

0.upto(7) do |idx|
  Refrigerator.create(
    user_id: (idx / 4) + 4,
    name: "#{food[idx]}",
    quantity: (idx % 3) + 1,
    purchase: 1.weeks.ago.advance(days: idx),
    deadline: 1.weeks.from_now.advance(days: idx),
    release: idx%2
  )
end

0.upto(7) do |idx|
  Refrigerator.create(
    user_id: (idx / 4) + 4,
    name: "#{fresh[idx]}",
    quantity: (idx % 3) + 1,
    purchase: 1.weeks.ago.advance(days: idx),
    deadline: nil,
    release: idx%2
  )
end
