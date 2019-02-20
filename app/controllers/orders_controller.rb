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
    @newOrderObject = {:user_id => @userID, :product_id => @productID, :total => @orderCost, :paid => @paid, :status => @status};
    # Insert object in DB > and redirect back

      respond_to do |format|

        @order = Order.new(@newOrderObject)

        if @order.save

          format.html do
            # JS is disabled > lets handle it with html request.
            # set notice
            flash[:notice] = "item added to your cart."

            redirect_back fallback_location: products_path

          end

          format.js

        else  # no order was created

          format.html do
            flash[:alert] = "There was an error adding your order. Please try again"

            redirect_back fallback_location: products_path
          end

          format.js do
            flash[:alert] = "There was an error adding your order. Please try again"
          end


        end

      end

  end

  def index
    # displays all orders for current user that are UNPAID > like a basic cart system
    @orders = Order.includes(:product).where(user_id: current_user.id, paid: 0).group(:product_id)
    @orderTotal = Order.where(user_id: current_user.id, paid: 0).sum(:total)
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
