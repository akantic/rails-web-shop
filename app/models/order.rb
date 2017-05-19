class Order < ApplicationRecord
  belongs_to :order_status
  belongs_to :user, optional: true
  has_many :order_products
  before_save :update_total


  def total
    order_products.collect { |op| op.valid? ? op.total_price : 0 }.sum
  end

  def product_count
    x = 0
    order_products.each do |product|
      x += product.quantity
    end

    return x
  end

  private
    def update_total
      self[:total] = total
    end

end
