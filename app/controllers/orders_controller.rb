class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    # prepare vars for DB entry
    @userID = current_user.id
    @productID = params[:order][:product_id]
    @paid = 0
    @status = 0
    # get Product object
    @orderProduct = Product.find(@productID)
    # Read info from given product
    @orderCost = @orderProduct.price

    # prepare object for DB entry
    @newOrderObject = [:user_id => @userID, :product_id => @productID, :total => @orderCost, :paid => @paid, :status => @status];
    # Insert object in DB > and redirect back

    if Order.create(@newOrderObject)
      # set notice
      flash[:notice] = "item added to your cart."
      # redirect with uneccesary origin check bc im not yet using ajax here.
      if request.env['HTTP_REFERER'] == "https://#{request.domain}/" || request.env['HTTP_REFERER'] == "http://#{request.domain}:3000/"
        redirect_to "#{request.env['HTTP_REFERER']}#product-card-#{@productID}"
      else
        redirect_to request.env['HTTP_REFERER']
      end


    else
      render html: "<script>alert('error adding product to cart')</script>".html_safe
    end
  end

  def index
    # displays all orders for current user that are UNPAID > like a basic cart system
    @orders = Order.includes(:product).where(user_id: current_user.id, paid: 0)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def destroy
    # prepare vars for DB entry
    @userID = current_user.id
    @orderID = params[:order][:order_id]
    # destroy order entrie
    Order.where(id: @orderID, user_id: @userID).delete_all
    # set notice
    flash[:notice] = "item removed from your cart."
    # redirect to
    redirect_to orders_path
  end
end
