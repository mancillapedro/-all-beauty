class ProductOrdersController < ApplicationController
  def index
    @orders = Order.all
  end    

  def create
    order = Order.new(order_params)
    order.save
    redirect_to product_orders
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end
    
  def order_params
    params.require(product_order).permit(:order, :product, :quantity)
  end

end
