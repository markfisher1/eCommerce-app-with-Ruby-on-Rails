# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# IF WE ARE RUNNING SEED LETS CLEAR THE SEEDED TABLES FIRST..

case Rails.env
when 'development' || 'test'
  # deal with products table
  ActiveRecord::Base.connection.execute("DELETE FROM products")
  # deal with orders table
  ActiveRecord::Base.connection.execute("DELETE FROM orders")
when 'production'
  # deal with products table
  ActiveRecord::Base.connection.execute("TRUNCATE products")
  # deal with orders table
  ActiveRecord::Base.connection.execute("DELETE FROM orders")
end

aves = File.open(Rails.root.join('app/assets/images/aves_shirt.jpg'))
belem = File.open(Rails.root.join('app/assets/images/belem_shirt.jpg'))
chaves = File.open(Rails.root.join('app/assets/images/chaves_shirt.jpg'))
feirense = File.open(Rails.root.join('app/assets/images/feirense_shirt.jpg'))
guimaraes = File.open(Rails.root.join('app/assets/images/guimaraes_shirt.jpg'))
maritimo = File.open(Rails.root.join('app/assets/images/maritimo_shirt.jpg'))
portimonense = File.open(Rails.root.join('app/assets/images/portimonense_shirt.jpg'))
rioave = File.open(Rails.root.join('app/assets/images/rio_ave_shirt.jpg'))
setubal = File.open(Rails.root.join('app/assets/images/setubal_shirt.jpg'))
tondela = File.open(Rails.root.join('app/assets/images/tondela_shirt.jpg'))
boavista = File.open(Rails.root.join('app/assets/images/boavista_shirt.jpg'))
braga = File.open(Rails.root.join('app/assets/images/braga_shirt.jpg'))
benfica = File.open(Rails.root.join('app/assets/images/slb_shirt.jpg'))
porto = File.open(Rails.root.join('app/assets/images/fcporto_shirt.jpg'))
sporting = File.open(Rails.root.join('app/assets/images/scp_shirt.jpg'))

productArray = [
  {name: 'Desportivo das Aves', description: 'Official Portuguese league football jersey.', colour: "red", price: 39.99, image: aves},
  {name: 'Belenenses SAD', description: 'Official Portuguese league football jersey.', colour: "blue", price: 39.99, image: belem},
  {name: 'Desportivo de Chaves', description: 'Official Portuguese league football jersey.', colour: "red", price: 39.99, image: chaves},
  {name: 'Moreirense', description: 'Official Portuguese league football jersey.', colour: "green", price: 39.99},
  {name: 'Feirense', description: 'Official Portuguese league football jersey.', colour: "blue", price: 39.99, image: feirense},
  {name: 'Vitoria de Guimaraes', description: 'Official Portuguese league football jersey.', colour: "white", price: 39.99, image: guimaraes},
  {name: 'Maritimo', description: 'Official Portuguese league football jersey.', colour: "red", price: 39.99, image: maritimo},
  {name: 'Portimonense', description: 'Official Portuguese league football jersey.', colour: "black", price: 39.99, image: portimonense},
  {name: 'Rio Ave', description: 'Official Portuguese league football jersey.', colour: "green", price: 39.99, image: rioave},
  {name: 'Vitoria de Setubal', description: 'Official Portuguese league football jersey.', colour: "green", price: 39.99, image: setubal},
  {name: 'Tondela', description: 'Official Portuguese league football jersey.', colour: "yellow", price: 39.99, image: tondela},
  {name: 'Boavista Futebol Clube', description: 'Official Portuguese league football jersey.', colour: "black", price: 49.99, image: boavista},
  {name: 'Sporting Clube de Braga', description: 'Official Portuguese league football jersey.', colour: "red", price: 49.99, image: braga},
  {name: 'Sport Lisboa e Benfica', description: 'Official Portuguese league football jersey.', colour: "red", price: 49.99, image: benfica},
  {name: 'Futebol Clube do Porto', description: 'Official Portuguese league football jersey.', colour: "blue", price: 49.99, image: porto},
  {name: 'Sporting Clube de Portugal', description: 'Official Portuguese league football jersey.', colour: "green", price: 49.99, image: sporting},
]

Product.create(productArray)
