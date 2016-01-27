class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      render text: "Error saving product"
    end
  end

  def index
    @products = Product.all
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end