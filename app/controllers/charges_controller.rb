class ChargesController < ApplicationController
  def new
  end

  def create
    # Amount in cents

    if current_user.address.blank? || current_user.postal_code.blank? || current_user.city.blank? || current_user.country.blank?
      flash[:error] = "You have to setup your shipping information before placing an order."
      redirect_to(edit_user_registration_path)
    else

      @order = Order.find(params[:order_id])

      customer = Stripe::Customer.create(
          :email => current_user.email,
          :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
          :customer    => customer.id,
          :amount      =>  (@order.total * 100).to_i,
          :description => 'Rails Stripe customer',
          :currency    => 'usd'
      )

      @order.update_attributes(user_id: current_user.id, order_status_id: 2)
      session.delete(:order_id)
      flash[:success] = "Your order has been placed successfully!"
      redirect_to(root_path)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
