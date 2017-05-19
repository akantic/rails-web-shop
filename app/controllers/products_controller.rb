class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @product_images = @product.product_images.order(:img_order)
    @reviews = Review.joins(:order_product).where(order_products: { product_id: @product.id }).all
  end
end