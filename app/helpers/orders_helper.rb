module OrdersHelper

  # give order delivery status icon
  # requests order object

  def order_status_icon(order)
    if order.status == 1
      "<i class='fas fa-shipping-fast text-success delivery-tooltip' data-toggle='tooltip' data-placement='top' title='package has been delivered'></i>".html_safe
    else
      "<i class='far fa-clock text-danger delivery-tooltip' data-toggle='tooltip' data-placement='top' title='package on their way'></i>".html_safe
    end
  end

  # give order paid status icon
  # requests order object

  def order_paid_icon(order)
    if order.paid == 1
      "<i class='fas fa-check text-success'></i>".html_safe
    else
      "<i class='fas fa-times text-danger'></i>".html_safe
    end
  end


  # format price individual item
  def getOrderPrice(order)
    if order.total > 0
      order.total = order.total * countRepeated(order)
      order.total = order.total.to_f / 100.to_f
    else
      order.total = "0.00"
    end
  end

  # format price total purchase
  def getTotalOrderPrice(value)
    if value > 0
      value.to_f / 100.to_f
    else
      "0.00"
    end
  end

  # generate description
  def getOrderDescription(orders)
    if orders.count == 1
      "#{orders.count} item."
    else
      "#{orders.count} items."
    end

  end

  # count number of similar products
  def countRepeated(order)
    Order.where("product_id = #{order.product_id} AND user_id = #{current_user.id} AND paid = 0").count
  end

end
