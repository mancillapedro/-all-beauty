class SuplierProductOrder < ApplicationRecord
  belongs_to :suplier
  belongs_to :product_order
  belongs_to :copy_product
end
