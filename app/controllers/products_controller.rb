class ProductsController < ApplicationController
  skip_after_action :verify_authorized, only: :my_meals

  def index

    if params[:query_1].present?
      sql_query = " \
        products.name @@ :query \
        OR products.category @@ :query \
        OR users.first_name @@ :query \
      "
      @products = policy_scope(Product).joins(:user).where(sql_query, query: "%#{params[:query_1]}%").order(price: :desc)
    else
      @products = policy_scope(Product).order(price: :desc)
    end
  end

  def show
    @product = Product.find(params[:id])
    @booking = Booking.new
    @review = Review.new
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
