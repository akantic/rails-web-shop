class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = current_user.orders
  end

  def new
    @order = current_order
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update_attributes(user_id: current_user.id, order_status_id: 2)
    puts @order.errors.inspect
    puts @order.valid?
    session.delete(:order_id)
    redirect_to(root_path)
  end
end

