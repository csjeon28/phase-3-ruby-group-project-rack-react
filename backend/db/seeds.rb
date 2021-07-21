User.destroy_all
Item.destroy_all
Board.destroy_all

5.times do
    User.create(username: Faker::Name.name, password: "password1")
end

Item.create(name: Faker::House.furniture, price: Faker::Commerce.price)

item_ids = Item.all.map{|item| item.id}
user_ids = User.all.map{|user| user.id}

10.times do
    Board.create(user_id: rand(user_ids.first..user_ids.last), item_id: rand(item_ids.first..item_ids.last))
end