require "rails_helper"

describe UsersController, type: :controller do

  User.destroy_all # I was getting an error due to 'username & email taken' so i decided to truncate the test table before go
  # not sure if it is correct but it works.

  userA = FactoryBot.build(:user, email: "emailA@email.com", username: "userA")
  userA.save # i need to save this one...
  userB = FactoryBot.build(:user, email: "emailB@email.com", username: "userB")
  userB.save # i need to save this one too...

  describe "GET #show" do

    context "user is logged in" do

      before do
        sign_in userA
      end

      it "blocks users from entering other user profile" do
        get :show, params: {id: userB.id}
        expect(response).not_to be_ok
        expect(flash[:alert]).not_to be nil
      end

      it "loads correct user profile" do
        get :show, params: {id: userA.id}
        expect(response).to be_ok
        expect(assigns(:user)).to eq userA
      end

    end

    context "user is NOT logged in" do

      it "redirects not logged user to homepage with alert" do
        get :show, params: {id: userA.id}
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).not_to be nil
      end

    end

  end

end
