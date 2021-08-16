class ProductOrder < ApplicationRecord
  belongs_to :order
  belongs_to :product

  def save_is_valid?
    quantity.positive? && (product.stock >= quantity) && save
  end
end
