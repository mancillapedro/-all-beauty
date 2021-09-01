class SuplierUserSupliersController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:index, :show, :down, :up]

  skip_before_action :authenticate_user!, only: [:index, :show, :down, :up]

  def index
    @suplier = current_user_suplier.suplier
  end

  def show
    @suplier = Suplier.find(params[:id])
    @products = @suplier.products
  end

  def down
    @suplier = current_user_suplier.suplier
    @suplier_product_orders = SuplierProductOrder.where(suplier: @suplier, status: 'False')
  end

  def up
    @suplier = current_user_suplier.suplier
    @suplier_product_orders = SuplierProductOrder.where(suplier: @suplier, status: 'True')
  end
end
