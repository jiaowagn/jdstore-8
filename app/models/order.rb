class Order < ApplicationRecord
  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address

  belongs_to :user
end
