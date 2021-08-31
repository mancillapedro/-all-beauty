class Suplier < ApplicationRecord
  has_many :products
  has_one :suplier_user_suplier
  has_one :user_suplier, through: :suplier_user_suplier
  has_many :suplier_product_orders
  has_one_attached :image

  def valid_img(attr)
    return "<%= cl_image_tag '#{image.key}', #{attr}%>" if image.attached?

    return "<%= image_tag '#{url_img}', #{attr} %>"
  end

  def valid_img_bg
    return "<%= cl_image_path '#{image.key}' %>" if image.attached?

    return "<%= '#{url_img}' %>"
  end
end
