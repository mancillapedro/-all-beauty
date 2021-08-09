class Product < ApplicationRecord
  belongs_to :category
  belongs_to :suplier
  has_many :product_orders
end
