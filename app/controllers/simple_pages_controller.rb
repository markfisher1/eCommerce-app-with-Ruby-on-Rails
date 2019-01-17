class SimplePagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_products = Product.limit(5).order("id desc")

    # santize output
    @featured_products.each.with_index do |prod, index|
      if prod.image_url == nil
        # image url > if empty > give default
        @featured_products[index].image_url = "default_product.jpg"
      end
    end

  end
end
