class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_one :order_suplier
  has_one :suplier, through: :order_suplier
end
