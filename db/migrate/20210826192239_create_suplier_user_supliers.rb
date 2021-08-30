class CreateSuplierUserSupliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suplier_user_supliers do |t|
      t.references :suplier, null: false, foreign_key: true
      t.references :user_suplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
