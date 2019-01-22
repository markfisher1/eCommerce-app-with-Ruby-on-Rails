# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# SEED FOR DUMMY PRODUCTS

# POPULATE ONLY IF NOT THERE.
# NOTE: This works based on array index order!!
# =>    It will count the records on the DB, subtract one since index is zero based and slice the array within that range, therefore deleting already inserted entries.
# => This only works if the NEW ITEMS ARE INSERTED BELOW THE ARRAY!

productArray = [
  {name: "Dummy 01", description: "Descritption for dummy 01", colour: "black", price: 127.35, image_url: "dummy_01.jpg"},
  {name: "Dummy 02", description: "Descritption for dummy 02", colour: "pink", price: 500.99, image_url: "dummy_02.jpg"},
  {name: "Dummy 03", description: "Descritption for dummy 03", colour: "purple", price: 199.50, image_url: "dummy_03.jpg"},
  {name: "Dummy 04", description: "Descritption for dummy 04", colour: "white", price: 25.69, image_url: "dummy_04.jpg"},
  {name: "Dummy 05", description: "Descritption for dummy 05", colour: "blue", price: 98.00, image_url: "dummy_05.jpg"},
  {name: "Dummy 06", description: "Descritption for dummy 06", colour: "transparent", price: 99.99, image_url: "dummy_06.jpg"},
  {name: "Dummy 07", description: "Descritption for dummy 07", colour: "salmon", price: 12.00, image_url: "dummy_07.jpg"},
  {name: "Dummy 08", description: "Descritption for dummy 08", colour: "green", price: 25.69, image_url: "dummy_08.jpg"},
  {name: "Dummy 09", description: "Descritption for dummy 09", colour: "black", price: 105.10, image_url: "dummy_09.jpg"},
  {name: "Dummy 10", description: "Descritption for dummy 10", colour: "red", price: 10.00, image_url: "dummy_10.jpg"},
  {name: "Dummy 11", description: "Descritption for dummy 11", colour: "diamond", price: 1750.99, image_url: "dummy_11.jpg"},
  {name: "Dummy 12", description: "Descritption for dummy 12", colour: "white", price: 350.00, image_url: "dummy_12.jpg"},
  {name: "Dummy 13", description: "Descritption for dummy 13", colour: "brown", price: 77.10, image_url: "dummy_13.jpg"},
  {name: "Dummy 14", description: "Descritption for pictureless dummy 14", colour: "orange", price: 200.00},
  {name: "Dummy 15", description: "Descritption for dummy 15", colour: "silver", price: 699.99, image_url: "dummy_15.jpg"},
  {name: "Dummy 16", description: "Descritption for dummy 16", colour: "black", price: 76.00, image_url: "dummy_16.jpg"}
]

# Lets compare table entries with array entries numbers.
# If db has less entries than the seed run the seed.. otherwise skip.
if Product.count < productArray.count

  # there is already products into the DB > Lets remove initial entries from array slincing it.
  if Product.count > 0
    sliceIndexEnd = Product.count - 1
    productArray.slice!(0..sliceIndexEnd)
  end

  # Lets run the seeding on the remaining / unedited array deppending on the scenario
  Product.create(productArray)
end


# SEED FOR DUMMY ORDERS
# POPULATE ONLY IF NOT THERE.
# NOTE: This works based on array index order!!
# =>    It will count the Dummy products on the DB and create 2 dummy orders for each product.
# =>    Script will simulate if order is paid or not based on randomness. Just to test output display.

if Order.count < (Product.count * 2)
orderArray = []
  Product.all.each.with_index do |prod, index| #loop Proucts and create orders.
    productID = index - 1
    2.times do
      isPaidOption = [0, 1]
      isPaid = isPaidOption.sample
      if isPaid == 1 # simulate delivered within paid items
        statusOption = [0, 1].sample
      else
        statusOption = 0
      end
      singleOrderArray = [{user_id: 1, product_id: productID, total: prod.price, paid: isPaid, status: statusOption}]
      orderArray << singleOrderArray
    end

  end

# place orderArray on order table.
Order.create(orderArray)

end
