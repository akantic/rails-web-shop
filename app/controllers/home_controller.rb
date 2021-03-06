class HomeController < ApplicationController
  helper_method :filtering_params

  def index
    @products = Product.where(nil)
    filtering_params(params).each do |key, value|
      @products = @products.public_send(key, value) if value.present?
    end

    @order = current_order
    @order_product = current_order.order_products.new
    @order_products = current_order.order_products
    @products = @products.paginate(page: params[:page])
  end

  def about

  end

  def welcome

  end

  private

# A list of the param names that can be used for filtering the Product list
  def filtering_params(params)
    params.slice(:with_manufacturer, :with_chipset, :with_display_resolution,
                  :with_display_size, :with_ram, :with_storage,
                  :with_rear_camera, :with_front_camera, :with_name)
  end

end
