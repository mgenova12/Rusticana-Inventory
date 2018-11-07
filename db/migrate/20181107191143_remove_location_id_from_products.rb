class RemoveLocationIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :location_id, :integer
    add_column :locations, :store_id, :integer
  end
end
