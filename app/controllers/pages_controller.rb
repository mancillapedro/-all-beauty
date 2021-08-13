class PagesController < ApplicationController
  skip_before_action :authenticate_user!,  only: [:home, :products, :marcas]

  def home
  end

end
