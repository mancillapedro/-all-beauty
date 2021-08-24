class OrderSuplier < ApplicationRecord
  belongs_to :order
  belongs_to :suplier
end
