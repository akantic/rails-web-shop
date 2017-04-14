class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_products
  before_validation :set_order_status
  before_save :update_subtotal


  def subtotal
    order_products.collect { |op| op.valid? ? (op.quantity * op.product_price) : 0 }.sum
  end

  private
    def set_order_status
      puts "setting order status"
      self.order_status_id = 1
    end

    def update_subtotal
      puts "updating subtotall"
      self[:subtotal] = subtotal
    end

end
