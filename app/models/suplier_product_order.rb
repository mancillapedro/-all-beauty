class SuplierProductOrder < ApplicationRecord
  belongs_to :suplier
  belongs_to :product_order
  belongs_to :copy_product

  def status_text
    status == "False" ? "Sin enviar" : "Enviado"
  end
end
