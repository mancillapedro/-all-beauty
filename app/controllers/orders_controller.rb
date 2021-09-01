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
        @order.product_orders.each do |p_o|
          new_suplier_product_order(p_o)
          p_o.product.update(stock: (p_o.product.stock - p_o.quantity))
        end
      end
    end
    redirect_to orders_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def new_copy_product(product)
    CopyProduct.create(name: product.name, description: product.description, price: product.price, url_img: product.url_img)
  end

  def new_suplier_product_order(product_order)
    copy_product = new_copy_product(product_order.product)
    total = product_order.product.price * product_order.quantity
    SuplierProductOrder.create(suplier: product_order.product.suplier, product_order: product_order, copy_product: copy_product, status: 'False', total: total)
  end
end
