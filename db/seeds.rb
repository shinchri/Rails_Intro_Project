# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# remove all data from the database
puts '*** Clearing data from all tables...'
Chef.destroy_all
Restaurant.destroy_all
Food.destroy_all
puts '*** Tables cleared!!!'

# Restaurant has :name, :address, :description, :review (Use Faker data => Faker::Restaurant, Faker::Address)
#   .name, .description, .review
#   .full_address
# Chef has :name (Use Faker data => Faker::Name.name)
# Food has :name, :recipe, :price
puts '*** Creating Restaurant and Chef...'
200.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, description: Faker::Company.type, review: Faker::Restaurant.review)

  chefs_per_restaurant = Faker::Number.between(3, 7)

  chefs_per_restaurant.times do
    restaurant.chefs.create(name: Faker::Name.name)
  end
end
puts '*** Restaurant and Chef created!!!'

puts '*** Creating Food...'
http_array = ['http://www.recipepuppy.com/api/?p=1',
              'http://www.recipepuppy.com/api/?p=2',
              'http://www.recipepuppy.com/api/?p=3',
              'http://www.recipepuppy.com/api/?p=4',
              'http://www.recipepuppy.com/api/?p=5',
              'http://www.recipepuppy.com/api/?p=6',
              'http://www.recipepuppy.com/api/?p=7',
              'http://www.recipepuppy.com/api/?p=8',
              'http://www.recipepuppy.com/api/?p=9',
              'http://www.recipepuppy.com/api/?p=10',
              'http://www.recipepuppy.com/api/?p=11',
              'http://www.recipepuppy.com/api/?p=12',
              'http://www.recipepuppy.com/api/?p=13',
              'http://www.recipepuppy.com/api/?p=14',
              'http://www.recipepuppy.com/api/?p=15',
              'http://www.recipepuppy.com/api/?p=16',
              'http://www.recipepuppy.com/api/?p=17',
              'http://www.recipepuppy.com/api/?p=18',
              'http://www.recipepuppy.com/api/?p=19',
              'http://www.recipepuppy.com/api/?p=20']

http_array.each do |address|
  response = HTTP.get(address).to_s
  results = JSON.parse(response)["results"]
  results.each do |x|
    Food.create(:name => x["title"], :recipe => x["ingredients"], :price => Faker::Commerce.price(range = 1..15.0))
  end
end
puts '*** Food created!!!'

puts '*** Assigning each restaurant with random Food....'
Restaurant.all.each do |restaurant|
  10.times do
    food = Food.all.sample
    restaurant.foods << food
  end
end
puts '*** Finished assigning Food to Restaurant!!!'


puts "After seeding the database: "
puts "   - There are #{Restaurant.count} restaurants."
puts "   - There are #{Chef.count} chefs."
puts "   - There are #{Food.count} foods."
