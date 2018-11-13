class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.decimal :amount
      t.integer :product_id

      t.timestamps
    end
  end
end
