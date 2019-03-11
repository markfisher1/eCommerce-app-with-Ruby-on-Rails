class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /users
  # GET /users.json
  def index
    # admin validation comes here
    adminPerms
  end

  # GET /users/1
  # GET /users/1.json
  def show
    set_user

    # get user past orders > limit 5
    @userLastOrders = Order.where(user_id: current_user.id, paid: 1).limit(5).order(updated_at: :desc)

    # cart items
    @cartItems = Order.where(user_id: current_user.id, paid: 0).all.order(updated_at: :desc)

    # number of cartItems
    if @cartItems.count == 0
      # there are NO items on cart
      @itemsInCart = "<span class='font-italic'>- empty -</span>".html_safe
      # give default price
      @cartTotalCost = "<span class='font-italic'>--</span>".html_safe
    else
      # there are items on cart
      @itemsInCart = "#{@cartItems.count} item(s)"
      # calculate total amount to pay with current cart
      @cartTotalCost = Order.where(user_id: current_user.id, paid: 0).sum(:total)
    end

    # escape possible NIL errors with user data
    if @user.first_name.blank?
      @user.first_name = "anonymous"
    end

    if @user.last_name.blank?
      @user.last_name = ""
    end


  end

  # GET /users/new
  def new
    # admin validation comes here
    flash[:alert] = "You have no permission to view the requested page."
    redirect_to root_path
  end

  # GET /users/1/edit
  def edit
    # admin validation comes here
    adminPerms

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :street_name, :zipcode, :house_number, :city, :country)
    end

    def adminPerms
      if !current_user&.admin?
        flash[:alert] = "You have no permission to view the requested page."
        redirect_to root_path
      end
    end

end
