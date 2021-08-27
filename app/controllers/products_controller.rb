class ProductsController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:new, :create]

  skip_before_action :authenticate_user!, only: [:index, :search, :autocomplete, :new, :create]

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

  # only user_suplier
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.suplier = current_user_suplier.suplier
    if @product.save
      redirect_to dashboard_path
    else
      render :new
    end
  end
  ######

  private

  def set_product_order
    current_user.carro.product_orders.where(product: @product).first || ProductOrder.new
  end

  def product_params
    params.require(:product).permit(:name, :description, :stock, :price, :category_id, :url_img)
  end
end
