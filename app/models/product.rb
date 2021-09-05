class Product < ApplicationRecord
  belongs_to :category
  belongs_to :suplier
  has_many :product_orders
  has_one_attached :image

  def valid_img(attr)
    return "<%= cl_image_tag '#{image.key}', #{attr}%>" if image.attached?

    return "<%= image_tag '#{url_img}', #{attr} %>"
  end

  def price_format
    ActionController::Base.helpers.number_to_currency(price, unit: "$", delimiter: ".", precision: 0)
  end
end
