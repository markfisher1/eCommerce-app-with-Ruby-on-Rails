require 'rails_helper'

describe Comment do

  let(:user) {User.create!(first_name: "test_first", last_name: "test_last", email: "test@test.test", password: "123456", username: "usernameTest")}
  let(:product) {Product.create!(name: "test product", description: "test description", price: 59.99)}
  let(:comment) {Comment.create!(user_id: user.id, body: "text comment", rating: 5, product_id: product.id)}

  it "validates that comment body is filled" do
    expect(comment.body).not_to be nil
  end

  it "validates rating is not empty" do
    expect(comment.rating).not_to be nil
  end

end
