User.destroy_all
Item.destroy_all
Board.destroy_all

5.times do
    User.create(username: Faker::Name.name, password: "password1")
end

Item.create(name: Faker::House.furniture, price: Faker::Commerce.price)

item_id = Item.all.map{|user| user.id}

Board.create(name: Faker::Commerce.department)

