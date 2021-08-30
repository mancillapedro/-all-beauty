class CreateCopyProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :copy_products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :url_img

      t.timestamps
    end
  end
end
