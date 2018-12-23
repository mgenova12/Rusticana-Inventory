class AddStoreGoodIdToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :store_good_id, :integer
    remove_column :inventories, :product_id, :integer
    remove_column :inventories, :prepcenter_product_id, :integer
    remove_column :inventories, :location_id, :integer
  end
end
