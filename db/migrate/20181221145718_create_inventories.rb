class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :prepcenter_product_id
      t.integer :quantity
      t.integer :quantity_needed
      t.integer :order_id

      t.timestamps
    end
  end
end
