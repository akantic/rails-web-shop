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

end

