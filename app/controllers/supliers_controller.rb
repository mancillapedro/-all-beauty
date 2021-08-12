class SupliersController < ApplicationController
  def show
    @suplier = Suplier.find(params[:id])
  end
end
