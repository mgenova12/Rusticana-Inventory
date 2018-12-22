class AddStoreIdToInventory < ActiveRecord::Migration[5.0]
  def change
    remove_column :prepcenter_products, :prepped, :boolean
    add_column :inventories, :message, :string
    add_column :inventories, :store_id, :integer
  end
end
