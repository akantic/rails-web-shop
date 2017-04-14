class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
  validate :order_present

  before_save :finalize

  def product_price
    if persisted?
      self[:product_price]
    else
      product.price
    end
  end

  def total_price
    product_price * quantity
  end

  private
    def product_present
      if product.nil?
        errors.add(:product, "is not valid or is not active.")
      end
    end

    def order_present
      if order.nil?
        errors.add(:order, "is not valid order.")
      end
    end

    def finalize
      self[:product_price] = product_price
      self[:total_price] = quantity * self[:product_price]
    end
end
