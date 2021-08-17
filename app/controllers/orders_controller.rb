class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :update]

  def index
    @order_carro = current_user.carro
    @orders_listas = Order.where(status: true, user: current_user)
  end

  def show; end

  def update
    unless @order.status
      total = @order.product_orders.sum { |p_o| p_o.product.price * p_o.quantity }
      if @order.update(status: true, total: total)
        @order.product_orders.each { |p_o| p_o.product.update(stock: (p_o.product.stock - p_o.quantity)) }
      end
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
