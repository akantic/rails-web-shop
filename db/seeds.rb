# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create(email: "admin@fer.hr", password:"123456", first_name:"Sample", last_name:"Admin", is_admin: true)
  User.create(email: "user@fer.hr", password:"123456", first_name:"Sample", last_name:"User", is_admin: false)
