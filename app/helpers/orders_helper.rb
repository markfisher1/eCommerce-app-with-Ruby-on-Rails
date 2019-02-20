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


  def getOrderPrice(order)
    if order.total > 0
      order.total = order.total.to_f / 100.to_f
    else
      order.total = "0.00"
    end
  end

  def getTotalOrderPrice(value)
    if value > 0
      value.to_f / 100.to_f
    else
      "0.00"
    end
  end

end
