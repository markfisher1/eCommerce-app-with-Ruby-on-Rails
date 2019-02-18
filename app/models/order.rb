class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user



  # TODO
  # use enumerators to assign status for the boolean.

  # enum status: [:in_traffic => 0, delivered: 1]
  # enum paid: [:unpaid, :paid]
end
