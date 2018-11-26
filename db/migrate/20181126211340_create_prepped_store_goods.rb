class CreatePreppedStoreGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :prepped_store_goods do |t|
      t.integer :store_id
      t.integer :prepcenter_product_id
      t.integer :location_id
      t.integer :max_amount

      t.timestamps
    end
  end
end
