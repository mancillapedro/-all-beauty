class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    # @product_order = ProductOrder.new
    @product_order = ProductOrder.where(product: @product).first || ProductOrder.new
  end
end
