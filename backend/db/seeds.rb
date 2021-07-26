User.destroy_all
Wish.destroy_all
Board.destroy_all

User.create(username: Faker::Name.name, password: "password1")
User.create(username: Faker::Name.name, password: "password2")
User.create(username: Faker::Name.name, password: "password3")

Wish.create(id: 1, title: "Accent Chairs", description: "For the living room")
Wish.create(id: 2, title: "Lamps", description: "For the bedroom")
Wish.create(id: 3, title: Faker::Coffee.blend_name, description: "Coffee blends I like")

Board.create(title: "Interior Design", description: "home design ideas")
Board.create(title: "Must-Have List", description: "things to buy for the home")
Board.create(title: "Drinks", description: "my favorite beverages")
