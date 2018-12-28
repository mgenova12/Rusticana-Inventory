class AddOutOfStockToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :out_of_stock, :boolean
  end
end
