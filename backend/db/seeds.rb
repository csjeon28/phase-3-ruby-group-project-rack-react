User.destroy_all
Wish.destroy_all
Board.destroy_all

User.create(username: Faker::Name.name)
User.create(username: Faker::Name.name)
User.create(username: Faker::Name.name)

puts "Seeding users..."

Wish.create(id: 1, title: "Accent Chairs", description: "For the living room", user_id: rand(1..20), board_id: rand(1..5))
Wish.create(id: 2, title: "Lamps", description: "For the bedroom", user_id: rand(1..20), board_id: rand(1..5))
Wish.create(id: 3, title: Faker::Coffee.blend_name, description: "Coffee blends I like", user_id: rand(1..20), board_id: rand(1..5))


puts "Seeding wishes..."

Board.create(name: "Interior Design", wish_id: rand(1..10))
Board.create(name: "Must-Have List", wish_id: rand(1..10))
Board.create(name: "Drinks", wish_id: rand(1..10))

puts "Seeding boards..."

puts "Done seeding"