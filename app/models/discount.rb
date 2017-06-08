class Discount < ApplicationRecord
  validates_numericality_of(:percent, greater_than_or_equal_to: 0, less_than_or_equal_to: 100)
  validate :not_exists
  belongs_to :product

  private
    def not_exists
      unless Discount.find_by_product_id(product_id).nil?
        errors.add(:product_id, "Discount for that product already exists!")
      end
    end
end
