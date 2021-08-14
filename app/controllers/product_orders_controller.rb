class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:destroy, :update]

  def index
    @product_orders = Order.find(params[:order_id]).product_orders
  end

  def create
    @product = Product.find(params[:product_id])
    @product_order = ProductOrder.new(product_order_params)
    @product_order.product = @product
    @product_order.order = current_user.carro
    if @product_order.save_is_valid?
      redirect_to order_path(@product_order.order)
    else
      render "products/show"
    end
  end

  def destroy
    @product_order.destroy
    redirect_to order_path(@product_order.order)
  end

  def update
    @product_order.quantity = product_order_params[:quantity]
    @order = @product_order.order
    @product_order.save_is_valid?
    # logica de operacion si la condician anterio se cumple
    render "orders/show"
  end

  private

  def product_order_params
    params.require(:product_order).permit(:quantity)
  end

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
  end
end
