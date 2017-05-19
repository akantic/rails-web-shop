class Review < ApplicationRecord
  belongs_to :order_product

  validates :rating, presence: true, numericality: { only_integer: true, greater_than: 0, lesser_than_or_equal: 5 }

end