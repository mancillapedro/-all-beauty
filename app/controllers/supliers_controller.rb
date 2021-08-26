class SupliersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @suplier = Suplier.find(params[:id])
  end

  def new

  end

  def create

  end
end
