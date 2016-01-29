class ProductsController < ApplicationController
  before_action :require_login

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_url
    else
      flash.now[:danger] = "Error saving product"
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_url
    else
      flash.now[:danger] = "Error updating product"
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    flash[:success] = "Successfully removed product"
    redirect_to products_url
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price, :url)
  end
end
