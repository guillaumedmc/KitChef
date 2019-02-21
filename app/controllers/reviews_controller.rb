class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [ :create]

  def new
    @review = Review.new
    authorize @review
    @product = Product.find(params[:product_id])
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @product = Product.find(params[:product_id])
    @review.user = current_user
    @review.product = @product
    if @review.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
