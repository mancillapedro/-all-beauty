class AddUrlImgToSupliers < ActiveRecord::Migration[6.0]
  def change
    add_column :supliers, :url_img, :string
  end
end
