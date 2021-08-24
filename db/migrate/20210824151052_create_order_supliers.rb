class CreateOrderSupliers < ActiveRecord::Migration[6.0]
  def change
    create_table :order_supliers do |t|
      t.references :order, null: false, foreign_key: true
      t.references :suplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
