module ProductsHelper

  def getProductPrice(product)
    if product.price > 0
      product.price = product.price.to_f / 100.to_f
    else
      product.price = "0.00"
    end
  end


  # LOL heroku cant handle my cache... lets hide something from them
  def getProdCache

    if Rails.env.development?
      if $redis.exists("product-list-cache")

        return "#{$redis.get("product-list-cache").html_safe}"

        logger.debug("[DOBBY] > CACHE OK > PRODUCTS LOADED")
        logger.debug("[DOBBY] > TTL REMAINING: #{$redis.ttl("product-list-cache")}")

      else

        content = render @products
        $redis.set("product-list-cache", content)
        $redis.expire("product-list-cache", 300)
        return "#{$redis.get("product-list-cache").html_safe}"

        logger.debug("[DOBBY] > CACHE NOT OK > PRODUCTS CACHED")
        logger.debug("[DOBBY] > TTL REMAINING: #{$redis.ttl("product-list-cache")}")

      end
    else

      return render @products

    end

  end
end
