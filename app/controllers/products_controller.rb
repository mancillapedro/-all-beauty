class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search]
  def index
    @products = Product.all
    @categories = Category.all
    @supliers = Suplier.all
  end

  def show
    @product = Product.find(params[:id])
    @product_order = set_product_order
  end

  def search
    @products = Product.where("lower(name) LIKE ?", "%#{params[:q].downcase}%")
  end

  def autocomplete
    products = Product.where("lower(name) LIKE ?", "%#{params[:q].downcase}%")
    @products = products.first(5).map { |e| e.name }
    puts "\n\n\nPRODUCTOS\n"
    p @products
    p @products.first.to_json
    render json: @products
  end

  private

  def set_product_order
    current_user.carro.product_orders.where(product: @product).first || ProductOrder.new
  end
end
