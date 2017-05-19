class OrderProductsController < ApplicationController
  def create
    @order = current_order
    @order_product = OrderProduct.new(order_product_params)
    @order_products = @order.order_products

    if @order_products.exists?(product_id: @order_product.product_id)
      @order_products.where(product_id: @order_product.product_id).first
          .increment!(:quantity, @order_product.quantity)
    else
      @order.order_products << @order_product
    end

    unless current_user.nil?
      @order.user = current_user
    end

    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.update_attributes(order_product_params)
    @order_products = @order.order_products

  end

  def destroy
    @order = current_order
    @order_product = @order.order_products.find(params[:id])
    @order_product.destroy
    @order_products = @order.order_products
  end

  private
    def order_product_params
      params.require(:order_product).permit(:quantity, :product_id)
    end
end
