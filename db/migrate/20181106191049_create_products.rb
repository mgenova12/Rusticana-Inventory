class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :measurement
      t.boolean :prepped
      t.string :item_type
      t.integer :case_quantity
      t.decimal :price
      t.integer :distributor_id
      t.integer :location_id

      t.timestamps
    end
  end
end
