# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Customer.destroy_all
Resort.destroy_all

breck = Resort.create!(name: 'Breck Ski Resort', city: 'Breckenridge', cost: 500, at_capacity: false)
aspin = Resort.create!(name: 'Aspin Ski Resort', city: 'Aspin',cost: 900, at_capacity: false)
love = Resort.create!(name: 'Loveland Ski Resort', city: 'Loveland', cost: 250, at_capacity: true)

breck.customers.create!(name: 'Tommy', equipment: true, age: 29)
breck.customers.create!(name: 'Harrison', equipment: true, age: 21)

aspin.customers.create!(name: 'Allison', equipment: false, age: 56)
aspin.customers.create!(name: 'Ryan', equipment: true, age: 50)

love.customers.create!(name: 'Mark', equipment: true, age: 37)
love.customers.create!(name: 'Cindy', equipment: false, age: 18)
