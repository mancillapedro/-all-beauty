class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :update]

  def index
    @order_carro = current_user.carro
    @orders_listas = Order.where(status: true)
  end

  def show; end

  def update
    unless @order.status
      total = 0
      @order.product_orders.each do |p_o|
        total = p_o.product.price * p_o.quantity
        stock = p_o.product.stock - p_o.quantity
        p_o.product.update(stock: stock)
      end
      @order.update(status: true, total: total)
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
