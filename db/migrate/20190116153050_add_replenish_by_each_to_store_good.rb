class AddReplenishByEachToStoreGood < ActiveRecord::Migration[5.0]
  def change
    add_column :store_goods, :replenish_by_each, :boolean
  end
end
