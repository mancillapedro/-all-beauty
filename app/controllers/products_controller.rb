class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :autocomplete]

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
    @products = search.first(5).map { |product| { name: product.name, path: product_path(product) } }
    render json: { date: Time.now, products: @products }
  end

  private

  def set_product_order
    current_user.carro.product_orders.where(product: @product).first || ProductOrder.new
  end
end
