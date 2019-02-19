require 'rails_helper'

describe User do

  let(:user) {User.create!(first_name: "test_first", last_name: "test_last", email: "test@test.test", password: "123456", username: "usernameTest")}

  it "validates username length" do
    expect(user.username.length).to be > 3
  end

  it "validates email length" do
    expect(user.email.length).to be > 3
  end

  it "validates email format" do
    expect(user.email.index("@")).not_to be nil
    expect(user.email.index(".")).not_to be nil
  end

end
