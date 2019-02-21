class ProductsController < ApplicationController
  skip_after_action :verify_authorized, only: :my_meals

  def index
    @products = policy_scope(Product).order(price: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    @reviews =
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
      redirect_to my_meals_products_path
    else
      render :new
    end
  end

  def my_meals
    @products = Product.select { |product| product.user == current_user }
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :covers, :photo, :user)
  end
end

