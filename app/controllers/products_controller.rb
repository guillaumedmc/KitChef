class ProductsController < ApplicationController
  skip_after_action :verify_authorized, only: :my_meals

  def index
    @products = policy_scope(Product).order(price: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    current_user.chef = true
    authorize @product
    if @product.save && current_user.save
      current_user.chef = true if current_user.chef != true
      redirect_to product_path(@product)
    else
      render :new
    end

  def my_meals
    @products = Product.where(user: current_user)
  end

  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :covers, :photo, :user)
  end
end

