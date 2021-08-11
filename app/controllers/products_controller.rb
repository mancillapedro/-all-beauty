class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    # @product_order = ProductOrder.new
    @product_order = ProductOrder.where(product: @product).first || ProductOrder.new
  end

  def search
    @products = Product.where("lower(name) LIKE ?", "%#{params[:q].downcase}%")
  end
end
