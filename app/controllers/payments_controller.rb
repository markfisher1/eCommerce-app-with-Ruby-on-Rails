class PaymentsController < ApplicationController
  before_action :authenticate_user!



  def create
    @ordersObject = params[:order_ids]
    @user = current_user
    # lets loop this and get the total ammount
    @totalPrice = 0

    logger.debug "[START] >> LOOP ORDERS OBJECT TO CALCULATE TOTAL PRICE"

    @ordersObject.each do |order_id|

      logger.debug "[LOOP RUN] >> LOOPING THROUGH #{order_id}"

      order = Order.find(order_id)

      # pre hack validation xD
      if order.user_id != @user.id
        redirect_to orders_path, alert: "Something went wrong with your order... Refresh the page and try again."
      end

      @totalPrice = @totalPrice + order.total
    end



    token = params[:stripeToken]

    #lets charge the user bling bling dingalong
    begin
      charge = Stripe::Charge.create(
        amount: @totalPrice,
        currency: "eur",
        source: token,
        description: params[:stripeEmail],
        receipt_email: @user.email
      )

    if charge.paid


      # lets update our orders paid field
      @ordersObject.each do |order_id|

        tmpVar = Order.find(order_id)

        # just because, you know, hacks.
        if tmpVar.user_id == @user.id
          tmpVar.paid = 1
          tmpVar.save

        else
          redirect_to orders_path, alert: "Your order has been paid but an error ocurred. Please contact the support"
        end

      end

      # format price for notice
      priceInEuros = @totalPrice.to_f / 100.to_f
      redirect_to orders_path, notice: "Thank you for the <span class='dollar'>€</span>#{priceInEuros}! Items will never arrive ahahaha."

    end

    # Something went wrong lets display what
    rescue Stripe::CardError => e

      body = e.json_body
      err = body[:error]

      redirect_to orders_path, alert: "Something went wrong with your payment request.<br><br>ERROR.: #{err[:message]}."
    end



  end

end
