class ProductsController < ApplicationController

  def index
    @products = policy_scope(Product).order(price: :desc)
  end

  def show
    @product = Product.find(params[:id])
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    authorize @product
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

private

  def product_params
    params.require(:product).permit(:id, :name, :description, :price, :category, :covers, :photo)
  end
end

