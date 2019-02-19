require 'rails_helper'

describe Product do

  let(:product) {Product.create!(name: "test shirt")}
  let(:user) {User.create!(first_name: "test_first", last_name: "test_last", email: "test@test.test", password: "123456", username: "usernameTest")}

  before do
    product.comments.create!(rating: 1, user: user, body: "test comment A.")
    product.comments.create!(rating: 3, user: user, body: "test comment B.")
    product.comments.create!(rating: 5, user: user, body: "test comment C.")
  end

  it "returns the average rating of all comments" do
    expect(product.average_rating).to eq 3
  end

end
