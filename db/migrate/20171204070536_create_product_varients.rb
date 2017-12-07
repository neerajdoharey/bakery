class CreateProductVarients < ActiveRecord::Migration[5.1]
  def change
    create_table :product_varients do |t|
    	t.references :product, foreign_key: true
      t.integer :quantity
      t.float :price
      t.timestamps
    end
  end
end
