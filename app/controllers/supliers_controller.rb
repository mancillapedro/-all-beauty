class SupliersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @suplier = Suplier.find(params[:id])
  end
end
