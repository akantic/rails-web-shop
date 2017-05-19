
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order, :order_products

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    elsif !current_user.nil?
      last_order = current_user.orders.last
      unless last_order.nil?
        if last_order.order_status.id == 1
          return last_order
        end
      end
      Order.new(order_status_id: 1)
    else
      Order.new(order_status_id: 1)
    end
  end

  def order_products
    current_order.order_products
  end


end
