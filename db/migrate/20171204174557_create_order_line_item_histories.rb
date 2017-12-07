class CreateOrderLineItemHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_line_item_histories do |t|
    	t.references :order_line_item, index: true, foreign_key: true
    	t.references :product_varient, index: true, foreign_key: true
      t.integer :quantity
      t.float :price

      t.timestamps
    end
  end
end
