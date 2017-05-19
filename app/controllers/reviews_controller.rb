class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @product = Product.find(params[:product_id])
    @order_id = params[:order_id]
  end

  def create
    @review = Review.new(review_params)
    @review.order_product = OrderProduct.where(order_id: params[:order_id], product_id: params[:product_id]).take

    if @review.save
      flash[:success] = "Review created successfully!"
    else
      flash[:danger] = "Failed to create review"
    end
    redirect_to order_path(params[:order_id])
  end

  private
    def review_params
      params.require(:review).permit(:content, :rating)
    end
end