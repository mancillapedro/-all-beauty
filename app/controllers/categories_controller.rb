class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @category = Category.find(params[:id])
  end
end
