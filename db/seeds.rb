# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(name: "John Doe", email: "john@gmail.com")
food1 = Food.create(name: 'Bananas', measurement_unit: 'grams', price: 12.99, quantity: 8, user_id: user.id)
food2 = Food.create(name: 'pears', measurement_unit: 'grams', price: 7.0, quantity: 4, user_id: user.id)
food3 = Food.create(name: 'potatoes', measurement_unit: 'grams', price: 9.10, quantity: 5, user_id: user.id)
recipe1 = Recipe.create(name: 'Banana Split', preparation_time: 10, cooking_time: 5, description: 'An American ice cream-based dessert consisting of a peeled banana cut in half lengthwise, and served with ice-cream and sauce between the two pieces.', user_id: user.id)
recipe2 = Recipe.create(name: 'Mashed Potatoes', preparation_time: 20, cooking_time: 50, description: 'A dish made by mashing boiled or steamed potatoes, usually with added milk, butter, salt and pepper. It is generally served as a side dish to meat or vegetables.', user_id: user.id)
