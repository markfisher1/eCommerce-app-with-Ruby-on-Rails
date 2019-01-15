# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create([
  {name: "Dummy 01", description: "Descritption for dummy 01", colour: "black", price: 127.35, image_url: "dummy_01.jpg"},
  {name: "Dummy 02", description: "Descritption for dummy 02", colour: "pink", price: 500.99, image_url: "dummy_02.jpg"},
  {name: "Dummy 03", description: "Descritption for dummy 03", colour: "purple", price: 199.50, image_url: "dummy_03.jpg"},
  {name: "Dummy 03", description: "Descritption for dummy 04", colour: "white", price: 25.69, image_url: "dummy_04.jpg"}
])
