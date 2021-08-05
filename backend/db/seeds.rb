User.destroy_all
Wish.destroy_all
Board.destroy_all

User.create(username: Faker::Name.name)
User.create(username: Faker::Name.name)
User.create(username: Faker::Name.name)

puts "Seeding users..."

20.times do
Wish.create(title: "Accent Chairs", description: "For the living room", user_id: rand(1..3), board_id: rand(1..10))
Wish.create(title: "Lamps", description: "For the bedroom", user_id: rand(1..3), board_id: rand(1..10))
Wish.create(title: Faker::Coffee.blend_name, description: "Coffee blends I like", user_id: rand(1..3), board_id: rand(1..10))
end

puts "Seeding wishes..."

Board.create(name: "Interior Design", wish_id: rand(1..10), user_id: rand(1..3))
Board.create(name: "Must-Have List", wish_id: rand(1..10), user_id: rand(1..3))
Board.create(name: "Drinks", wish_id: rand(1..10), user_id: rand(1..3))
Board.create(name: "Tech Toys", wish_id: rand(1..10), user_id: rand(1..3))
Board.create(name: "Sports", wish_id: rand(1..10), user_id: rand(1..3))

puts "Seeding boards..."

puts "Done seeding"