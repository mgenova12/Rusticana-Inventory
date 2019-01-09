class CreateQuickProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :quick_products do |t|
      t.string :name
      t.string :measurement
      t.integer :quantity_needed

      t.timestamps
    end
  end
end
