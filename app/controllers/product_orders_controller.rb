class ProductOrdersController < ApplicationController
  before_action :set_product_order, only: [:destroy, :update]

  def index
    @product_orders = Order.find(params[:order_id]).product_orders
  end

  def create
    @product_order = ProductOrder.new(product_order_params)
    @product_order.product = Product.find(params[:product_id])
    @product_order.order = set_order
    if @product_order.save
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
    unless @product_order.order.status
      if @product_order.update(product_order_params)
        redirect_to order_path(@product_order.order)
      else
        render "orders/show"
      end
    end
  end

  private

  def product_order_params
    params.require(:product_order).permit(:quantity)
  end

  def set_product_order
    @product_order = ProductOrder.find(params[:id])
  end

  def set_order
    current_user.orders.where(status: false).first || Order.create(user: current_user, status: false)
  end
end
