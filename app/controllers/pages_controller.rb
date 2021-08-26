class PagesController < ApplicationController
  before_action :authenticate_user_suplier!, only: [:dashboard]

  skip_before_action :authenticate_user!, only: [:home, :about, :dashboard]

  def home
    @supliers = Suplier.all
  end

  def about; end

  def dashboard; end
end
