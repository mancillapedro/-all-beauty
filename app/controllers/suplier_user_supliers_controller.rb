class SuplierUserSupliersController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:index, :show, :down]

  skip_before_action :authenticate_user!, only: [:index, :show, :down]

  def index
    @suplier = current_user_suplier.suplier
  end

  def show
    @suplier = Suplier.find(params[:id])
    @products = @suplier.products
  end

  def down
    @suplier = current_user_suplier.suplier
    @down = SuplierProductOrder.where(suplier: @suplier, status: 'pagado')
  end
end
