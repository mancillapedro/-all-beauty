class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :destroy, #:edit, :update]

  def index
    @orders = Order.all
  end    

  def show
  end

  def new
    @order = Order.new
  end

  def create
    order = Order.new(task_params)
    order.save
    redirect_to product_orders
  end

  # def edit
  # end

  # def update
   # @task.update(order_params)
   # redirect_to order_path(@order)
  # end

  def destroy
    @order.destroy
    redirect_to orders_path
  end
    
  def set_order
    @order = Order.find(params[:id])
  end

end
