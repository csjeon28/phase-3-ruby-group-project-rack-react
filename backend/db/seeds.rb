User.destroy_all
Item.destroy_all
Board.destroy_all


User.create(username: Faker::Name.name, password: "password1")
User.create(username: Faker::Name.name, password: "password2")
User.create(username: Faker::Name.name, password: "password3")

Item.create(title: "Accent Chairs", description: "For the living room", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXgTQhuqlQnAoQb0HKZ1OKu8gMcE_-U_bhEJzLwDa7sGLF-4m5iPgp6JxwB30&usqp=CAc", price: Faker::Commerce.price, board_id: 1)
Item.create(title: "Lamps", description: "For the bedroom", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcDhD-nxbxRT8dVx5nFH-JRZ2tYOkvAIvJf1TMolCw7WZ1DeFiNUKiGhgUwQ&usqp=CAc", price: Faker::Commerce.price, board_id: 2)
Item.create(title: Faker::Coffee.blend_name, description: "Coffee blends I like", image_url: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F9%2F2014%2F12%2FHD-201210-ss-aged-foods-coffee-beans.jpg&q=85", price: Faker::Commerce.price, board_id: 3)

item_ids = Item.all.map{|item| item.id}
user_ids = User.all.map{|user| user.id}

Board.create(title: "Interior Design", description: "home design ideas", user_id: rand(user_ids.first..user_ids.last), item_id: rand(item_ids.first..item_ids.last))
Board.create(title: "Must-Have List", description: "things to buy for the home", user_id: rand(user_ids.first..user_ids.last), item_id: rand(item_ids.first..item_ids.last))
Board.create(title: "Drinks", description: "my favorite beverages", user_id: rand(user_ids.first..user_ids.last), item_id: rand(item_ids.first..item_ids.last))
