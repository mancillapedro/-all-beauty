class SupliersController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:new, :create, :edit, :update]

  skip_before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update]

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

  def edit
    @suplier = Suplier.find(params[:id])
  end

  def update
    @suplier = Suplier.find(params[:id])
    if @suplier.update(suplier_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def suplier_params
    params.require(:suplier).permit(:name, :address, :phone_number, :email, :url_img, :image)
  end
end
