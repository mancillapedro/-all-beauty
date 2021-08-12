class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, :update]

  def index
    @order_carro = Order.where(status: false).first
    @orders_listas = Order.where(status: true)
  end

  def show; end

  def update
    unless @order.status
      total = @order.product_orders.sum { |pro| pro.product.price * pro.quantity }
      @order.update(status: true, total: total)
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
