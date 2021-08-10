class ProductOrdersController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :set_product_order, only: [:show, :destroy]

  def show; end

  def create
    @product_order = ProductOrder.new(product_order_params)
    @product_order.product = @product
    @product_order.order = current_user.orders.first
    @product_order.save
    redirect_to order_path(@product_order.order)
  end

  def destroy
    @product_order.destroy
    redirect_to root_path
  end

  private

  def product_order_params
    params.require(:product_order).permit(:order, :product, :quantity)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
  end
end
