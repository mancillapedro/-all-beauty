class AddUrlImgToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :url_img, :string
  end
end
