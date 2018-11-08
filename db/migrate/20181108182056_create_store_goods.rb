class CreateStoreGoods < ActiveRecord::Migration[5.0]
  def change
    create_table :store_goods do |t|
      t.integer :store_id
      t.integer :product_id
      t.integer :location_id
      t.integer :distributor_id

      t.timestamps
    end
  end
end
