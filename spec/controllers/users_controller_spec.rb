require "rails_helper"

describe UsersController, type: :controller do

  let(:userA) {User.create!(username: "testUserA", email: "testA@test.com", password: "123456")}
  let(:userB) {User.create!(username: "testUserB", email: "testB@test.com", password: "123456")}


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
