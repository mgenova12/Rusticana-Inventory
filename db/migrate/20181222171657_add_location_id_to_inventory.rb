class AddLocationIdToInventory < ActiveRecord::Migration[5.0]
  def change
    add_column :inventories, :location_id, :integer
    change_column :inventories, :message, :text
  end
end
