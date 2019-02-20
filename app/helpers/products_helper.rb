module ProductsHelper

  def getProductPrice(product)
    if product.price > 0
      product.price = product.price.to_f / 100.to_f
    else
      product.price = "0.00"
    end
  end

end
