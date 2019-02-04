class Product < ApplicationRecord
  has_many :orders

  # call back to ensure data has a standardised default value if empty
  before_save :add_defaults

  # private method to add the default value if field is left empty
  private
  def add_defaults
    # image default
    if image_url.blank?
      self.image_url = "default_product.jpg"
    end
    # description default
    if description.blank?
      self.description = "N/A"
    end
    # color default
    if colour.blank?
      self.colour = "N/A"
    end
    # price default
    if price.blank?
      self.price = 0
    end
    # name default
    if name.blank?
      self.name = "undefined"
    end
  end

end
