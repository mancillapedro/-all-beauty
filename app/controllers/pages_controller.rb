class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about]

  def home
    @supliers = Suplier.all
  end

  def about; end
end
