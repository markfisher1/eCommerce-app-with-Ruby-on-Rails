require 'rails_helper'

describe Order do

  let(:user) {User.create!(first_name: "test_first", last_name: "test_last", email: "test@test.test", password: "123456", username: "usernameTest")}
  let(:product) {Product.create!(name: "test product", description: "test description", price: 59.99)}
  let(:order) {Order.create!(user_id: user.id, product_id: product.id, paid: 0, status: 0, total: product.price)}


  # silly validation to implement tests.
  it "matches order value with product price" do
    expect(order.total).to eq product.price
  end

end
