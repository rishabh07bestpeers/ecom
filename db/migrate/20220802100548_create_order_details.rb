class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :subtotal
      t.references :order
      t.timestamps
    end
  end
end
