class SuplierProductOrdersController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:update]

  skip_before_action :authenticate_user!, only: [:update]

  def update
    @suplier_product_order = SuplierProductOrder.find(params[:id])
    @suplier_product_order.status = "True"
    if @suplier_product_order.save
      redirect_to down_path
    else
      render "suplier_user_supliers/down"
    end
  end
end
