class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  # mounting image uploader
  mount_uploader :image, ProductImageUploader

  # call back to ensure data has a standardised default value if empty
  before_save :add_defaults

  # validate product stuff
  validates :name, presence: true

  #get highest rated comment from product
  def highest_rating_comment
    comments.rating_desc.first
  end

  # get lowest rated comment from product
  def lowest_rating_comment
    comments.rating_asc.first
  end

  # calculate product average rating
  def average_rating
    comments.average(:rating).to_f
  end

  private # PRIVATE AREA BELOW

  # private method to search from model

  def self.search(search_term)
    # if development or test use LIKE
    if Rails.env.development? || Rails.env.test?
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      # if not > use ilike for postgres
      Product.where("name ilike ?", "%#{search_term}%")
    end

  end

  # private method to add the default value if field is left empty
  def add_defaults

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
