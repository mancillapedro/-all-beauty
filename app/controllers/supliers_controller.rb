class SupliersController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:new, :create]

  skip_before_action :authenticate_user!, only: [:show, :new, :create]

  def show
    @suplier = Suplier.find(params[:id])
  end

  def new
    @suplier = Suplier.new
  end

  def create
    @suplier = Suplier.new(suplier_params)
    if @suplier.save
      SuplierUserSuplier.create(suplier: @suplier, user_suplier: current_user_suplier)
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  def suplier_params
    params.require(:suplier).permit(:name, :address, :phone_number, :email)
  end
end
