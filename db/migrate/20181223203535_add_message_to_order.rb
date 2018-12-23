class AddMessageToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :message, :text
    add_column :orders, :store_id, :integer
    remove_column :inventories, :message, :text
  end
end
