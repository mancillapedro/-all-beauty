class Suplier < ApplicationRecord
  has_many :products
  has_one :suplier_user_suplier
  has_one :user_suplier, through: :suplier_user_suplier
  has_many :suplier_product_orders
end
