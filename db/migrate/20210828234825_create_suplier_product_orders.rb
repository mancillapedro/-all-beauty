class CreateSuplierProductOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :suplier_product_orders do |t|
      t.references :suplier, null: false, foreign_key: true
      t.references :product_order, null: false, foreign_key: true
      t.references :copy_product, null: false, foreign_key: true
      t.string :status
      t.integer :total

      t.timestamps
    end
  end
end
