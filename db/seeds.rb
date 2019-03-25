# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = Dir[File.join(Rails.root, 'db', 'seeds', "users.rb")][0]
puts "Seeding #{users}..."
load(users) if File.exist?(users)

products = Dir[File.join(Rails.root, 'db', 'seeds', "products.rb")][0]
puts "Seeding #{products}..."
load(products) if File.exist?(products)

inventories = Dir[File.join(Rails.root, 'db', 'seeds', "inventories.rb")][0]
puts "Seeding #{inventories}..."
load(inventories) if File.exist?(inventories)

orders = Dir[File.join(Rails.root, 'db', 'seeds', "orders.rb")][0]
puts "Seeding #{orders}..."
load(orders) if File.exist?(orders)
