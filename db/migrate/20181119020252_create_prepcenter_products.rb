class CreatePrepcenterProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :prepcenter_products do |t|
      t.string :name
      t.string :measurement
      t.boolean :prepped
      t.string :item_type
      t.integer :portion_size
      t.decimal :markup
      t.integer :product_id

      t.timestamps
    end
  end
end
