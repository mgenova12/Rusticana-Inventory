class AddStoreIdToQuickProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :quick_products, :store_id, :integer
  end
end
