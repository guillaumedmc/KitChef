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
    authorize @product
    @product.save
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category, :covers)
  end
end
