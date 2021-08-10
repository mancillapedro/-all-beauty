class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy]

  def index
    @orders = Order.all
  end

  def show; end

  def create
    order = Order.new(order_params)
    order.user = current_user
    order.save
    redirect_to order
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:total, :status)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
