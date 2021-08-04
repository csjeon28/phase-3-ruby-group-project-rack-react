User.destroy_all
Wish.destroy_all
Board.destroy_all

User.create(username: Faker::Name.name)
User.create(username: Faker::Name.name)
User.create(username: Faker::Name.name)

puts "Seeding users..."

Wish.create(title: "Accent Chairs", description: "For the living room", user_id: 1, board_id: 2)
Wish.create(title: "Lamps", description: "For the bedroom", user_id: 2, board_id: 4)
Wish.create(title: Faker::Coffee.blend_name, description: "Coffee blends I like", user_id: 3, board_id: 5)


puts "Seeding wishes..."

Board.create(name: "Interior Design", wish_id: 1, user_id: 1)
Board.create(name: "Must-Have List", wish_id: 2, user_id: 2)
Board.create(name: "Drinks", wish_id: 3, user_id: 2)
Board.create(name: "Tech Toys", wish_id: 2, user_id: 3)
Board.create(name: "Sports", wish_id: 1, user_id: 3)

puts "Seeding boards..."

puts "Done seeding"