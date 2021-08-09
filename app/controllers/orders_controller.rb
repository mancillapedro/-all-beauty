class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    order = Order.new(order_params)
    order.save
    redirect_to orders
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:user, :total, :status)
  end
end
