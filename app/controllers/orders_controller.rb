class OrdersController < ApplicationController
  def create
  end

  def index
    @orders = Order.includes(:product).all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
  end

  def destroy
  end
end
