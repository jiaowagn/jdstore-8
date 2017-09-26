class Order < ApplicationRecord
  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address

  belongs_to :user
  has_many :product_lists

  before_create :generate_token

  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

end
