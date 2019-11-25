class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url, default: "https://coactivehealthshop.co.uk/wp-content/uploads/test-product.png"

      t.timestamps
    end
  end
end
